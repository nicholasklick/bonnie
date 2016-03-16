class Thorax.Views.MeasurePatientDashboard extends Thorax.Views.BonnieView

  template: JST['measure/patient_dashboard']

  initialize: ->
    calculationResults = []
    @model.get('populations').each (population) ->
      calculationResults.push(population.calculationResults().toJSON())
    @results = calculationResults

    @views = []
    @criteria_text_hash = {}
    @criteria_order_list = []

    #Grab all populations related to this measure
    codes = (population['code'] for population in @model.get('measure_logic'))
    @populations = _.intersection(Thorax.Models.Measure.allPopulationCodes, codes)

    # Grab all data criteria and pass them into DataCriteriaLogic
    for reference in Object.keys(@model.get('data_criteria'))
      @dataLogicView = new Thorax.Views.DataCriteriaLogic(reference: reference, measure: @model)
      @views.push(@dataLogicView)

    @population_criteria = {} # "Type" => "Preconditions"
    for code in Thorax.Models.Measure.allPopulationCodes #TODO add multiple population_set support
      if code in Object.keys(@model.get('populations')['models'][0]['attributes'])
        @population_criteria[code] = @model.get('populations')['models'][0].get(code)['preconditions']
    ##DEBUG of VIEWS####
    @view.appendTo('body') for @view in @views
    ###############

    @dispIppColumns = []
    @dispNumerColumns = []
    @dispDenomColumns = []
    @dispDenexcepColumns = []

    @ippColumns = []
    @numerColumns = []
    @denomColumns = []
    @denexcepColumns = []

    @FIXED_ROWS = 2
    @FIXED_COLS = 2 + @populations.length

    @COL_WIDTH_NAME = 140
    @COL_WIDTH_POPULATION = 36
    @COL_WIDTH_META = 100
    @COL_WIDTH_FREETEXT = 240
    @COL_WIDTH_CRITERIA = 180

    @expandedRows = [] # used to ensure that expanded rows stay expanded after re-render

  events:
    ready: ->
      @createTable()

  createTable: ->
    container = @$('#patient_dashboard_table').get(0)
    patients = @model.get('patients')
    hot = new Handsontable(container, {
      data: @createData(@views, patients),
      colWidths: @getColWidths()
      fixedRowsTop: @FIXED_ROWS,
      fixedColumnsLeft: @FIXED_COLS,
      mergeCells: @createMergedCells(@model, patients),
      readOnly: true,
      renderAllRows: true, # handsontable's optimizer for rendering doesn't manage hidden rows well. Rendering all to fix.
      renderAllColumns: true, # partial rendering creates unpleasant jiltiness when scrolling horizontally. Rendering all to fix.
      cells: (row, col, prop) =>
        cellProperties = {};
        if row == 0
          cellProperties.renderer = @header1Renderer
        else if row == 1
          cellProperties.renderer = @header2Renderer
        else
          cellProperties.renderer = @dataRenderer
        return cellProperties
      ,
      afterSelection: (rowIndexStart, colIndexStart, rowIndexEnd, colIndexEnd) =>
        if colIndexStart == colIndexEnd && rowIndexStart == rowIndexEnd
          if colIndexStart == 0
            @toggleExpandableRow(container, rowIndexStart)
          # TODO: figure out where people should actually click to have this pop up
          if colIndexStart == 1
            # TODO: figure out what actually needs to be passed into this view to appropraitely pass into the patient edit view
            patientEditView = new Thorax.Views.MeasurePatientEditModal(model: @model.get('patients').models[0], measure: @model, patients: @model.get('patients'), measures = @model.collection)
            patientEditView.appendTo(@$el)
            patientEditView.display()
      })

  toggleExpandableRow: (container, rowIndex) =>
    if rowIndex > 1 && rowIndex%2 == 0
      expandableRowIndex = rowIndex + 1
      for table in $(container).find('table')
        tr = $(table).find('tr#row' + expandableRowIndex.toString()).get(0)
        if tr
          if $(tr).hasClass('expandable-hidden')
            Handsontable.Dom.removeClass(tr, 'expandable-hidden')
            Handsontable.Dom.addClass(tr, 'expandable-shown')
            @expandedRows.push(expandableRowIndex)
          else
            Handsontable.Dom.removeClass(tr, 'expandable-shown')
            Handsontable.Dom.addClass(tr, 'expandable-hidden')
            @expandedRows = @expandedRows.filter (index) -> index != expandableRowIndex

  header1Renderer: (instance, td, row, col, value, cellProperties) =>
    Handsontable.renderers.TextRenderer.apply(this, arguments)
    Handsontable.Dom.addClass(td, 'header')
    @addDiv(td)
    @getColor(instance, td, row, col, value, cellProperties)

  header2Renderer: (instance, td, row, col, value, cellProperties) =>
    Handsontable.renderers.TextRenderer.apply(this, arguments)
    Handsontable.Dom.addClass(td, 'header')
    if col >= 2 && col <= (@populations.length * 2) + 1
      Handsontable.Dom.addClass(td, 'rotate')
      @addDiv(td)
    else
      @addScroll(td)

  dataRenderer: (instance, td, row, col, value, cellProperties) =>
    Handsontable.renderers.TextRenderer.apply(this, arguments)
    Handsontable.Dom.addClass(td, 'content')
    @addDiv(td)

    # enabling expandable detail rows. Need to do by id because of how handsontable efficiently
    # renders the table
    tr = td.parentElement
    tr.id = "row" + row
    if row%2 == 1
      if row in @expandedRows
        Handsontable.Dom.addClass(tr, 'expandable-shown')
      else
        Handsontable.Dom.addClass(tr, 'expandable-hidden')

  getColor: (instance, td, row, col, value, cellProperties) =>
    if @ippColumns[0] <= col && @ippColumns[@ippColumns.length-1] >= col
      Handsontable.Dom.addClass(td, "ipp")
    else if (@numerColumns[0] <= col && @numerColumns[@numerColumns.length-1] >= col)
      Handsontable.Dom.addClass(td, "numer")
    else if (@denomColumns[0] <= col && @denomColumns[@denomColumns.length-1] >= col)
      Handsontable.Dom.addClass(td, "denom")
    else if (@denexcepColumns[0] <= col && @denexcepColumns[@denexcepColumns.length-1] >= col)
      Handsontable.Dom.addClass(td, "denexcep")
    else
      Handsontable.Dom.addClass(td, "basic")

  addDiv: (element) =>
    text = element.textContent
    element.firstChild.remove()
    $(element).append('<div>' + text + '</div>')

  addScroll: (element) =>
    text = element.textContent
    element.firstChild.remove()
    $(element).append('<div class="tableScrollContainer"><div class="tableScroll">' + text + '</div></div>')

  # TODO: refactor the processing code below once we know what the patient data model will look like

  getColWidths: ()  =>
    colWidths = []

    # for first name and last name
    colWidths.push(@COL_WIDTH_NAME)
    colWidths.push(@COL_WIDTH_NAME)

    # for the expected and actual populations
    colWidths.push(@COL_WIDTH_POPULATION) for [1..@populations.length*2]

    # for the notes
    colWidths.push(@COL_WIDTH_FREETEXT)

    # for birthdate, expired, deathdate
    colWidths.push(@COL_WIDTH_META)
    colWidths.push(@COL_WIDTH_META)
    colWidths.push(@COL_WIDTH_META)

    # for race and ethnicity
    colWidths.push(@COL_WIDTH_FREETEXT)
    colWidths.push(@COL_WIDTH_FREETEXT)

    # for gender
    colWidths.push(@COL_WIDTH_META)

    # for criteria
    colWidths.push(@COL_WIDTH_CRITERIA) for [0..@ippColumns.length-1]
    colWidths.push(@COL_WIDTH_CRITERIA) for [0..@numerColumns.length-1]
    colWidths.push(@COL_WIDTH_CRITERIA) for [0..@denomColumns.length-1]
    colWidths.push(@COL_WIDTH_CRITERIA) for [0..@denexcepColumns.length-1]

    return colWidths

  createData: (measure,patients) =>
    #@getOptionalRows()
    data = []
    headers = @createHeaderRows(measure, patients)
    data.push(headers[0])
    data.push(headers[1])

    @createPatientRows(patients, data)

    return data

  createMergedCells: (measure, patients) =>
    mergedCells = [{row:0, col:2, colspan:@populations.length, rowspan:1},{row:0, col:7, colspan:@populations.length, rowspan:1}]
    if @ippColumns.length > 0
      mergedCells.push({row: 0, col: @ippColumns[0], colspan: @ippColumns.length, rowspan:1})
    if @numerColumns.length > 0
      mergedCells.push({row: 0, col: @numerColumns[0], colspan: @numerColumns.length, rowspan:1})
    if @denomColumns.length > 0
      mergedCells.push({row: 0, col: @denomColumns[0], colspan: @denomColumns.length, rowspan:1})
    if @denexcepColumns.length > 0
      mergedCells.push({row: 0, col: @denexcepColumns[0], colspan: @denexcepColumns.length, rowspan:1})

    return mergedCells

  createHeaderRows: (measure, patients) =>

    row1 = ['','','Expected','','','','Actual','','','','','','','','','',''] #TODO Make this dynamic.
    row2 = ['First Name','Last Name']
    attributes = ['Notes','Birthdate','Expired','Deathdate','Ethnicity','Race','Gender']

    #TODO There must be a better way to duplicate items in list.
    for population in @populations
      row2.push(population)
    for population in @populations
      row2.push(population)

    row2 = row2.concat(attributes)

    population_code_data_criteria_map = {}
    criteria_keys_by_population = @criteria_keys_by_population()

    for @view in measure
      @criteria_text_hash[@view.dataCriteria.key] = @view.$el[0].outerText

    for code in Thorax.Models.Measure.allPopulationCodes
      if criteria_keys_by_population[code]?
        for criteria in criteria_keys_by_population[code]
          row1.push(' ')
          row2.push(@criteria_text_hash[criteria])
          @criteria_order_list.push(criteria)

#    curColIndex = row2.length
#    @createHeaderSegment(row1, row2, @dispIppColumns, @population_criteria['IPP'], @ippColumns, curColIndex, "IPP")
#    curColIndex = row2.length
#    @createHeaderSegment(row1, row2, @dispNumerColumns, @population_criteria['NUMER'], @numerColumns, curColIndex, "NUMER")
#    curColIndex = row2.length
#    @createHeaderSegment(row1, row2, @dispDenomColumns, @population_criteria['DENOM'], @denomColumns, curColIndex, "DENOM")
#    curColIndex = row2.length
#    @createHeaderSegment(row1, row2, @dispDenexcepColumns, @population_criteria['DENEXCEP'], @denexcepColumns, curColIndex, "DENEXCEP")

    [row1, row2]

  createHeaderSegment: (row1, row2, useColumnsArray, measureColumns, colIndexArray, curColIndex, headerString) =>
    isFirstRow = true
    colIndexArray.length = 0
    for value in useColumnsArray
      if isFirstRow
        row1.push(headerString)
      else
        row1.push("")
      row2.push(' ')
      #row2.push(measureColumns[value])
      colIndexArray.push(curColIndex)
      curColIndex++
      isFirstRow = false

  createPatientRows: (patients, data) =>
    for patient, i in patients.models
      patientRow = @createPatientRow(patient);
      patientDetailRow = @createPatientDetailRow(patient, i, patientRow);
      data.push(patientRow);
      data.push(patientDetailRow);

  createPatientRow: (patient) =>

     patient_values = []
     patient_attributes = ['notes','birthdate','expired','deathdate','ethnicity','race','gender']
     #Match results to patients.
     patient_result = @match_patient_to_patient_id(patient.id)

     patient_values.push(patient.get('first'))
     patient_values.push(patient.get('last'))
     #Get the expected values from patient object. First must match to measure_ids
     patient_values = patient_values.concat(@extract_patient_expected_values(patient, @populations))
     #Get the actual values from patient object.
     patient_values = patient_values.concat(@extract_value_for_population_type(patient_result, @populations))

     #Add patient attribute values to patient value array.
     for attribute in patient_attributes
       patient_values.push(patient.get(attribute))

     data_criteria_values = @extract_data_criteria_value(patient_result)
     patient_values = patient_values.concat(data_criteria_values)

  match_patient_to_patient_id: (patient_id) =>
    patients = @results[0] #TODO will need to add population_set support
    # Iterate over each of the patients to match the patient_id
    patient = (patient for patient in patients when patient.patient_id == patient_id)[0]

  extract_patient_expected_values: (patient, populations) =>
    expected_model = (model for model in patient.get('expected_values').models when model.get('measure_id') == @model.get('hqmf_set_id'))[0]
    expected_values = []
    for population in populations
      if population not in expected_model.keys()
        expected_values.push(0)
      else
        expected_values.push(expected_model.get(population))
    return expected_values

  # populates the array with actual values for each population
  extract_value_for_population_type: (patient_result, populations) =>
    patient_actuals = []
    for population in populations
      if population == 'OBSERV'
        if population of patient_result #TODO investigate observe
          console.log("In Observ if statment")
        else
          patient_actuals.push(0)
      else if population of patient_result
        patient_actuals.push(patient_result[population])
      else
        patient_actuals.push('X')
    return patient_actuals

  # Extracts the data_criteria values for each patient.
  extract_data_criteria_value: (patient_result) =>  #TODO Clean up
    data_criteria_values = []
    for criteria in @criteria_order_list
      if criteria of patient_result['rationale']
        value = patient_result['rationale'][criteria]
        if value != null && value != 'false' && value != false
          data_criteria_values.push('TRUE')
        else if value == 'false' || value == false
          data_criteria_values.push('FALSE')
        else
          data_criteria_values.push(value)
      else
        data_criteria_values.push('')
    return data_criteria_values

#TODO Fill in headers correctly
#TODO Specific occurrence code
#TODO Observ code
#TODO Fix all over TODOs

    # Change value if specific rationale is involved.
#    if @patient[:specificsRationale] && @patient[:specificsRationale][population_type]
#      specific_value = @patient[:specificsRationale][population_type][criteria_key]

      # value could be "false", nil, "true"
#      if specific_value == "false" && value == "TRUE"
#        value = "SPECIFICALLY FALSE"
#      elsif specific_value == "true" && value == "FALSE"
#        value = "SPECIFICALLY TRUE"
#      end
#    end

#    return value
#  end

############################## Measure Criteria Keys ##############################

  # Given a data criteria, return the list of all data criteria keys referenced within, either through
  # children criteria or temporal references; this includes the passed in criteria reference
  data_criteria_criteria_keys: (criteria_reference) =>
    criteria_keys = [criteria_reference]
    if criteria = @model.get('data_criteria')[criteria_reference]
      if criteria['children_criteria']?
        criteria_keys = criteria_keys.concat(@data_criteria_criteria_keys(criteria) for criteria in criteria['children_criteria'])
        criteria_keys = flatten(criteria_keys)
      if criteria['temporal_references']?
        criteria_keys = criteria_keys.concat(@data_criteria_criteria_keys(temporal_reference['reference']) for temporal_reference in criteria['temporal_references'])
        criteria_keys = flatten(criteria_keys)

    return criteria_keys

  # Given a precondition, return the list of all data criteria keys referenced within
  precondition_criteria_keys: (precondition) =>
    if precondition['preconditions'] && precondition['preconditions'].length > 0
      results = (@precondition_criteria_keys(precondition) for precondition in precondition['preconditions'])
      results = flatten(results)
    else if precondition['reference']
      @data_criteria_criteria_keys(precondition['reference'])
    else
      []

  # Return the list of all data criteria keys in this measure, indexed by population code
  criteria_keys_by_population: () =>
    criteria_keys_by_population = {}
    for name, precondition of @population_criteria
      if precondition?
        criteria_keys_by_population[name] = @precondition_criteria_keys(precondition[0]).filter (ck) -> ck != 'MeasurePeriod'
    criteria_keys_by_population

#TODO Make this coffeescript. Or use underscore.js
  `function flatten(arr) {
    const flat = [].concat(...arr)
    return flat.some(Array.isArray) ? flatten(flat) : flat;
  }`

###################################################################################

  createPatientDetailRow: (patient, rowIndex, patientSummaryRow) =>
    row = [];
    for value in patientSummaryRow
      row.push("DETAIL " + rowIndex.toString())
    return row

    @createPatientSegment(ret, @dispIppColumns, patient.ipp);
    @createPatientSegment(ret, @dispNumerColumns, patient.numer);
    @createPatientSegment(ret, @dispDenomColumns, patient.denom);
    @createPatientSegment(ret, @dispDenexcepColumns, patient.denexcep);

    return ret;

  createPatientSegment: (row, dispColumns, patientColumn) =>
    for value in dispColumns
      row.push(patientColumn[value])

  getOptionalRows: ->
    @dispIppColumns.length = 0
    @dispNumerColumns.length = 0
    @dispDenomColumns.length = 0
    @dispDenexcepColumns.length = 0
    for key, value of @demoMeasure.ipp
      @dispIppColumns.push(key)
    for key, value of @demoMeasure.numer
      @dispNumerColumns.push(key)
    for key, value of @demoMeasure.denom
      @dispDenomColumns.push(key)
    for key, value of @demoMeasure.denexcep
      @dispDenexcepColumns.push(key)

class Thorax.Views.MeasurePatientEditModal extends Thorax.Views.BonnieView
  template: JST['measure/patient_edit_modal']

  events:
    'ready': 'setup'

  initialize: ->
    @patientBuilderView = new Thorax.Views.PatientBuilder(model: @model, measure: @measure, patients: @patients, measures: @measures, showCompleteView: false)

  setup: ->
    @editDialog = @$("#patientEditModal")

  display: ->
    @editDialog.modal(
      "backdrop" : "static",
      "keyboard" : true,
      "show" : true).find('.modal-dialog').css('width','1000px') # TODO: figure out what the appropriate relative width should be

  save: (e)->
    status = @patientBuilderView.save(e)
    if status
      @editDialog.modal(
        "backdrop" : "static",
        "keyboard" : false,
        "show" : true)
      @editDialog.modal('hide')

  close: -> ''
