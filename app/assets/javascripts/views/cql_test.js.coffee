class WrappedEntry
  constructor: (@entry) ->
  getCode: ->
    allCodes = []
    for system, codes of @entry.codes
      for code in codes
        allCodes.push code: code, system: system
    allCodes
  get: (attribute) ->
    switch attribute
      when 'start datetime'
        cql.DateTime.fromDate(moment.utc(@entry.start_time, 'X').toDate())
      when 'stop datetime'
        cql.DateTime.fromDate(moment.utc(@entry.end_time, 'X').toDate())
      else
        console.log "Requesting unknown attribute #{attribute} from entry"
  toString: -> "#{@entry.description} (#{moment.utc(@entry.start_time, 'X').format('L LT')})"

class WrappedPatient
  constructor: (@patient) ->
  id: -> @patient.id
  findRecords: (profile) ->
    switch profile
      when 'Patient'
        [{ 'birth datetime': cql.DateTime.fromDate(moment.utc(@patient.get('birthdate'), 'X').toDate()) }]
      when 'DiagnosisActive'
        _(@patient.get('conditions')).map (c) -> new WrappedEntry(c)
      when 'EncounterPerformed'
        _(@patient.get('encounters')).map (e) -> new WrappedEntry(e)
      when 'MedicationDischarge'
        _(@patient.get('medications')).map (m) -> new WrappedEntry(m)
      else
        console.log "Requesting unknown profile #{profile} from patient"

class PatientSource
  constructor: (@patients) -> @index = 0
  currentPatient: -> new WrappedPatient(@patients.at(@index)) if @patients.at(@index)
  nextPatient: -> @index += 1


class Thorax.Views.CqlTestView extends Thorax.Views.BonnieView

  template: JST['cql_test']

  initialize: ->
    @resultCollection = new Thorax.Collection()
    @collection.each (patient) =>
      @resultCollection.add(new Thorax.Model(first: patient.get('first'), last: patient.get('last'), patient_id: patient.id, values: []))

  events:
    "submit form": (event) ->
      event.preventDefault()
      cql = @$('textarea').val()
      post = $.post "measures/cql_to_elm", { cql: cql, authenticity_token: $("meta[name='csrf-token']").attr('content') }
      post.done (response) => @updateElm(response)
      post.fail (response) => @displayErrors(response.responseJSON)

  updateElm: (elm) ->
    patientSource = new PatientSource(@collection)
    @results = executeSimpleELM(elm, patientSource, @valueSetsForCodeService())
    @render()
    @resultCollection.each (patient) =>
      patientResults = @results.patientResults[patient.get('patient_id')]
      patient.set(values: _(@resultKeys()).map (key) -> patientResults[key])

  displayErrors: (response) ->
    errors = response.library.annotation.map (annotation) -> "Line #{annotation.startLine}: #{annotation.message}"
    alert "Errors:\n\n#{errors.join("\n\n")}"

  resultKeys: ->
    return [] unless @results
    # Assume first result is representative of keys
    resultValues = _(@results.patientResults).values()
    return [] unless resultValues.length > 0
    resultKeys = _(resultValues[0]).keys()
    _(resultKeys).without('Patient') # The Patient record is included

  context: ->
    _(super).extend headers: @resultKeys()

  #patientContext: (p) ->
  #  return p.toJSON() unless @results
  #  patientResults = @results.patientResults[p.id]
  #  _(p.toJSON()).extend values: _(@resultKeys()).map (key) -> patientResults[key]

  valueSetsForCodeService: ->
    valueSetsForCodeService = {}
    for oid, vs of bonnie.valueSetsByOid
      continue unless vs.concepts
      valueSetsForCodeService[oid] ||= {}
      valueSetsForCodeService[oid][vs.version] ||= []
      for concept in vs.concepts
        valueSetsForCodeService[oid][vs.version].push code: concept.code, system: concept.code_system_name, version: vs.version
    valueSetsForCodeService

    # "1.2.3.4.5": {
    #   "1": [
    #     {
    #       "code": "ABC",
    #       "system": "5.4.3.2.1",
    #       "version": "1"
    #     }, {
    #       "code": "DEF",
    #       "system": "5.4.3.2.1",
    #       "version": "2"
    #     }, {
    #       "code": "GHI",
    #       "system": "5.4.3.4.5",
    #       "version": "3"
    #     }
    #   ],
