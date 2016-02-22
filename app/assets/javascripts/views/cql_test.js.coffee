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


class Thorax.Views.CqlResultsView extends Thorax.Views.BonnieView

  template: JST['cql_results']

  initialize: ->
    # Perform a full re-render on collection update to capture header changes
    @collection.on 'add remove change', => @render()

  context: ->
    # Assume all patients have same fields, so we can just extract headers from the first one
    if patient = @collection.first() then results = patient.get('results') else {}
    _(super).extend headers: _(results).chain().omit('Patient').keys().value()

  patientContext: (p) ->
    # Extract just the values from the results; omit the Patient field, since it's not a statement result
    return _(p.toJSON()).extend values: _(p.get('results')).chain().omit('Patient').values().value()

class Thorax.Views.CqlTestView extends Thorax.Views.BonnieView

  template: JST['cql_test']

  initialize: ->
    @resultCollection = new Thorax.Collection()
    @collection.each (patient) =>
      @resultCollection.add(new Thorax.Model(id: patient.id, first: patient.get('first'), last: patient.get('last'), results: {}))
    @resultsView = new Thorax.Views.CqlResultsView(collection: @resultCollection)

  events:
    "ready": ->
      @$('#cqlTestDialog').modal(backdrop: 'static', show: true)
    "submit form": (event) ->
      event.preventDefault()
      cql = @$('textarea').val()
      post = $.post "measures/cql_to_elm", { cql: cql, authenticity_token: $("meta[name='csrf-token']").attr('content') }
      post.done (response) => @updateElm(response)
      post.fail (response) => @displayErrors(response.responseJSON)

  updateElm: (elm) ->
    patientSource = new PatientSource(@collection)
    results = executeSimpleELM(elm, patientSource, @valueSetsForCodeService())
    @resultCollection.each (patient) => patient.set(results: results.patientResults[patient.id])

  displayErrors: (response) ->
    errors = response.library.annotation.map (annotation) -> "Line #{annotation.startLine}: #{annotation.message}"
    alert "Errors:\n\n#{errors.join("\n\n")}"

  valueSetsForCodeService: ->
    valueSetsForCodeService = {}
    for oid, vs of bonnie.valueSetsByOid
      continue unless vs.concepts
      valueSetsForCodeService[oid] ||= {}
      valueSetsForCodeService[oid][vs.version] ||= []
      for concept in vs.concepts
        valueSetsForCodeService[oid][vs.version].push code: concept.code, system: concept.code_system_name, version: vs.version
    valueSetsForCodeService
