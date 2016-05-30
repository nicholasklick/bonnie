class PatientSource
  constructor: (@patients) -> @index = 0
  currentPatient: -> new CQL_QDM.CQLPatient(@patients.at(@index)) if @patients.at(@index)
  nextPatient: -> @index += 1

class Thorax.Views.CqlPlaygroundView extends Thorax.Views.BonnieView

  template: JST['cql/cql_playground']

  initialize: ->
    @resultCollection = new Thorax.Collection()
    @collection.each (patient) =>
      @resultCollection.add(new Thorax.Model(id: patient.id, first: patient.get('first'), last: patient.get('last'), results: {}))
    #@resultsView = new Thorax.Views.CqlResultsView(collection: @resultCollection)

  events:
    "ready": ->
      @$('#cqlTestDialog').modal(backdrop: 'static', show: true)
      @editor = ace.edit("editor")
      @editor.setTheme("ace/theme/xcode")
      @editor.setShowPrintMargin(false)
      @editor.setValue(@exampleCql(), -1)
    "submit form": (event) ->
      event.preventDefault()
      cql = @$('textarea').val()
      post = $.post "measures/cql_to_elm", { cql: cql, authenticity_token: $("meta[name='csrf-token']").attr('content') }
      post.done (response) => @updateElm(response)
      post.fail (response) => @displayErrors(response)

  updateElm: (elm) ->
    patientSource = new PatientSource(@collection)
    results = executeSimpleELM(elm, patientSource, @valueSetsForCodeService())
    @resultCollection.each (patient) => patient.set(results: results.patientResults[patient.id])

  displayErrors: (response) ->
    switch response.status
      when 500
        alert "CQL translation error: #{response.statusText}"
      when 400
        errors = response.responseJSON.library.annotation.map (annotation) -> "Line #{annotation.startLine}: #{annotation.message}"
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

  exampleCql: ->
    'library AsthmaMeasure version "1"\nusing QDM\n\nvalueset "Persistent Asthma": "2.16.840.1.113883.3.464.1003.102.12.1023"\nvalueset "Encounter Inpatient": "2.16.840.1.113883.13.190.5.6"\nvalueset "Preferred Asthma Therapy": "2.16.840.1.113883.3.464.1003.196.12.1212"\n\nparameter MeasurementPeriod default Interval[DateTime(2012, 1, 1, 0, 0, 0, 0), DateTime(2013, 1, 1, 0, 0, 0, 0))\n\ncontext Patient\n\ndefine "$Encounters":\n\t["Encounter, Performed": "Encounter Inpatient"] E\n\t\twhere E."admissionDatetime" during MeasurementPeriod\n'