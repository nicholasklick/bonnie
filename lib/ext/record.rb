# Extensions to the Record model in health-data-standards to add needed functionality for test patient generation
class Record
  field :type, type: String
  field :measure_ids, type: Array
  field :source_data_criteria, type: Array
  field :expected_values, type: Array
  field :notes, type: String
  field :is_shared, :type => Boolean
  field :origin_data, type: Array

  belongs_to :user
  belongs_to :bundle, class_name: "HealthDataStandards::CQM::Bundle"
  scope :by_user, ->(user) { where({'user_id'=>user.id}) }

  # User email or measure CMS ID can be prepopulated (to solve 1+N performance issue) or just retrieved
  attr_writer :user_email
  def user_email
    @user_email || user.try(:email)
  end

  attr_writer :cms_id
  def cms_id
    @cms_id || begin
                 measure_id = measure_ids.first # gets the primary measure ID
                 measure = Measure.where(hqmf_set_id: measure_id, user_id: user_id).first # gets corresponding measure, for this user
                 measure.try(:cms_id)
               end
  end

  def rebuild!(payer=nil)
    Measures::PatientBuilder.rebuild_patient(self)
    if payer
      insurance_provider = InsuranceProvider.new
      insurance_provider.type = payer
      insurance_provider.member_id = '1234567890'
      insurance_provider.name = Measures::PatientBuilder::INSURANCE_TYPES[payer]
      insurance_provider.financial_responsibility_type = {'code' => 'SELF', 'codeSystem' => 'HL7 Relationship Code'}
      insurance_provider.start_time = Time.new(2008,1,1).to_i
      insurance_provider.payer = Organization.new
      insurance_provider.payer.name = insurance_provider.name
      insurance_provider.codes["SOP"] = [Measures::PatientBuilder::INSURANCE_CODES[payer]]
      self.insurance_providers.clear << insurance_provider
    end
  end

  def qrda_expected_values(measure)
    evs = []
    measure.first.populations.each_with_index do |pop, idx|
      pop.each do |pkey, pvalue|
        if pkey == 'id' || pkey == 'title' || pkey.downcase.match(/^strat/) || pkey == 'OBSERV'
          next
        end
        this_ev = { code: nil, display_name: nil, hqmf_id: nil, expected_value: nil }
        this_ev[:hqmf_id] = measure.first.population_criteria[pvalue.to_s]['hqmf_id']
        if pkey == 'DENEX'
          this_ev[:display_name] = 'Denominator Exclusions'
        else
          this_ev[:display_name] = measure.first.population_criteria[pvalue.to_s]['title']
        end
        this_ev[:code] = pkey == 'IPP' ? 'IPOP' : pkey
        # Going to assume that any expected_value > 0 is a TRUE
        # As per HL7 CDA R2:QRDA I, R1, STU Release 3.1, US Realm, Vol. 2 —Templates and Supporting Material
        # Set negationInd="false" to assert true (that the criteria are met by the included data). Set negationInd="true" to assert false (that the criteria are not met by the included data).
        this_ev[:expected_value] = expected_values[idx][pkey].to_s == '0' ? 'true' : 'false'
        evs << this_ev
      end
    end
    evs # return
  end

end
