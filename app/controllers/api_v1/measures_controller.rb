class ApiV1::MeasuresController < ApplicationController

  respond_to :json, :html

  # GET /api_v1/measures
  def index
    # TODO filter by search parameters, for example an NQF ID or partial description
    skippable_fields = [:map_fn, :hqmf_document, :oids, :population_ids]
    @api_v1_measures = Measure.by_user(current_user)
    respond_with @api_v1_measures do |format|
      format.json{ 
        render json: MultiJson.encode(
          @api_v1_measures.map do |x|
            h = x.measure_json
            h[:id] = x.id
            skippable_fields.each{|f|h.delete(f)}
            h
          end
        )
      }
      format.html{ render :layout => false }
    end
  end

  # GET /api_v1/measures/1
  def show
    hash = {}
    http_status = 200
    begin
      @api_v1_measure = Measure.by_user(current_user).find(params[:id])
      hash = @api_v1_measure.measure_json
      hash[:id] = @api_v1_measure.id
    rescue
      http_status = 404
    end
    render json: hash, status: http_status
  end

  # GET /api_v1/measures/1/patients
  def patients
    @api_v1_patients = []
    http_status = 200
    begin
      # Get the measure
      @api_v1_measure = Measure.by_user(current_user).find(params[:id])
      # Extract out the HQMF set id, which we'll use to get related patients
      hqmf_set_id = @api_v1_measure.measure_json[:hqmf_set_id]
      # Get the patients for this measure
      @api_v1_patients = Record.by_user(current_user).where({:measure_ids.in => [ hqmf_set_id ]})
    rescue
      http_status = 404
    end
    render json: @api_v1_patients, status: http_status
  end

  # GET /api_v1/measures/1/evaluate
  def evaluate
    http_status = 200
    response = {}

    begin
      # Get the measure
      @api_v1_measure = Measure.by_user(current_user).find(params[:id])
      # Extract out the HQMF set id, which we'll use to get related patients
      hqmf_set_id = @api_v1_measure.measure_json[:hqmf_set_id]
      # Get the patients for this measure
      @api_v1_patients = Record.by_user(current_user).where({:measure_ids.in => [ hqmf_set_id ]})
    rescue
      http_status = 404
    end

    if http_status != 404
      response['status'] = 'complete'
      response['messages'] = []
      response['measure_id'] = params[:id]
      response['patient_count'] = @api_v1_patients.size
      response['populations'] = []

      calculator = BonnieBackendCalculator.new

      @api_v1_measure.populations.each_with_index do |population,population_index|
       
        population_response = []

        begin
          calculator.set_measure_and_population(@api_v1_measure, population_index, rationale: true)
        rescue => e
          response['status'] = 'error'
          response['messages'] << "Measure setup exception: #{e.message}"
        end

        if response['status']!='error'
          @api_v1_patients.each do |patient|
            # Generate the calculated rationale for each patient against the measure.
            begin
              population_response << calculator.calculate(patient)
              # binding.pry
            rescue Exception => e
              response['status'] = 'error'
              response['messages'] << "Measure calculation exception: #{e.message}"
            end
          end
          response['populations'] << population_response
        end
      end

      http_status = 500 if response['status'] == 'error'
    end

    response.delete('messages') if !response['messages'].nil? && response['messages'].empty?
    render json: response, status: http_status
  end

  # POST /api_v1/measures
  def create
    # TODO
    # TODO: update test/controllers/api_v1/measures_controller_test.rb::test "should create api_v1_measure"
  end

  # PUT /api_v1/measures/1
  def update
    # TODO
    # TODO: update test/controllers/api_v1/measures_controller_test.rb::test "should update api_v1_measure"
  end

end