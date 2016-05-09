class Thorax.Views.MeasurePatientDashboardLayout extends Thorax.LayoutView
  template: JST['measure/patient_dashboard_layout']
  className: 'patient-dashboard-layout'

  switchPopulation: (e) ->
    @population = $(e.target).model()
    @population.measure().set('displayedPopulation', @population)
    @setView new Thorax.Views.MeasurePopulationPatientDashboard(measure: population.measure(), population: @population)
    @trigger 'population:update', @population

  populationContext: (population) ->
    _(population.toJSON()).extend
      isActive:  population is population.measure().get('displayedPopulation')
      populationTitle: population.get('title') || population.get('sub_id')
  
  setView: (view) ->
    results = @population.calculationResults()
    results.calculationsComplete =>
      view.results = results
      super(view)

class Thorax.Views.MeasurePopulationPatientDashboard extends Thorax.Views.BonnieView
  template: JST['measure/patient_dashboard']
  className: 'patient-dashboard'

  initialize: ->
    # commenting out race and ethinicity becuase these are not measured in eCQMs
    # #TODO Duplication of code for mapping code to race / ethnicity - See patient_builder.hbs
    # @race_map = {}
    # @race_map["1002-5"] = "American Indian or Alaska Native"
    # @race_map['2028-9'] = "Asian"
    # @race_map["2054-5"] = "Black or African American"
    # @race_map["2076-8"]= "Native Hawaiian or Other Pacific Islander"
    # @race_map["2106-3"] = "White"
    # @race_map["2131-1"] = "Other"
    #
    # @ethnicity_map = {}
    # @ethnicity_map["2186-5"] = "Not Hispanic or Latino"
    # @ethnicity_map["2135-2"] = "Hispanic Or Latino"

    #Grab all populations related to this measure
    @patientEditView = new Thorax.Views.MeasurePatientEditModal(dashboard: this)
    
    codes = (population['code'] for population in @measure.get('measure_logic'))
    @populations = _.intersection(Thorax.Models.Measure.allPopulationCodes, codes)

    @pd = new Thorax.Models.PatientDashboard(@measure,@populations,@population)

    @FIXED_ROWS = 2
    @FIXED_COLS = @getFixedColumnCount()

    @editableRows = [] # used to ensure rows marked for inline editing stay that way after re-render

    @editableCols = @getEditableCols() # these are the fields that should be inline editable
    
    @results = @population.calculationResults()
    @results.calculationsComplete =>
      @patientResults = @results.toJSON()
      container = @$('#patient_dashboard_table').get(0)
      patients = @measure.get('patients')
      patientData = @createData(patients)
      @widths = @getColWidths()
      @head1 = patientData.slice(0,1)[0]
      @head2 = patientData.slice(1,2)[0]
      @data = patientData.slice(2)

  context: ->
    _(super).extend
      patients: @data
      head1: @head1
      head2: @head2
      widths: @widths

  events:
    rendered: ->
      $('.container').removeClass('container').addClass('container-fluid')
      @patientEditView.appendTo(@$el)
    destroyed: ->
      $('.container-fluid').removeClass('container-fluid').addClass('container')

    ready: ->
      # $('#example').DataTable( {
      #   columnDefs: [
      #     {targets: [0,1], width:"90px"}
      #   ]
      #   });
      totalWidth = 0
      for width in @widths
        totalWidth += width
        
      # $('#patientDashboardTable').css("width", totalWidth)
      table = $('#patientDashboardTable').DataTable( {
        autoWidth: false,
        columns: @getColWidths2(),
        scrollX: true,
        scrollY: "500px",
        paging: false,
        fixedColumns: { leftColumns: 5 },
        headerCallback: (thead, data, start, end, display) =>
          row = thead # TODO: will this change if we have multiple rows in the header?
          $(row).children().each (colIndex, element) =>
            if @pd.isIndexInCollection(colIndex, 'expected') || @pd.isIndexInCollection(colIndex, 'actual')
              $(element).addClass('rotate')
        # columnDefs: [
        #   {targets: [0,1], width:"90px"}
        # ]
        })
      blah = "blah"
      #@createTable()

  getPatientData: ->
    @patientResults = @results.toJSON()
    container = @$('#patient_dashboard_table').get(0)
    patients = @measure.get('patients')
    @data = @createData(patients)

  createTable: ->
    @results = @population.calculationResults()
    @results.calculationsComplete =>
      @patientResults = @results.toJSON()

      container = @$('#patient_dashboard_table').get(0)
      patients = @measure.get('patients')
      @data = @createData(patients)
      that = this
      @hot = new Handsontable(container, {
        data: @data,
        colWidths: @getColWidths(),
        copyPaste: false, # need this to avoid 508 issue
        fixedRowsTop: @FIXED_ROWS,
        fixedColumnsLeft: @FIXED_COLS,
        mergeCells: @createMergedCells(@measure, patients),
        readOnly: true,
        readOnlyCellClassName: '', # avoid using the default .htDimmed... it'll just make the whole table grey.
        renderAllRows: true, # handsontable's optimizer for rendering doesn't manage hidden rows well. Rendering all to fix.
        #renderAllColumns: true,
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
        afterRender: (isForced) ->
          colOffset = this.colOffset()
          # go through every table and adjust the markup generated by HOT
          for table in $('table.htCore')

            # see if it's a fixed table. if it's a fixed table, we don't need
            # to adjust the index of the cell
            parent = $(table)
            while parent && parent.length > 0
              parent = $(parent).parent()
              if $(parent).hasClass('handsontable')
                break
            if parent
              fixedTable = $(parent).hasClass('ht_clone_top_left_corner')

            $(table).addClass('table')

            header_row1 = $(table).find('tr:not([data-row]):first-child td')
            header_row2 = $(table).find('tr:not([data-row]):nth-child(2) td')

            for cell in header_row1
              unless $(cell).attr('colspan') is undefined
                # replace <td> tags with <th> tags manually
                $(cell).replaceWith(
                  '<th colspan='+$(cell).attr('colspan')+
                  ' scope="col" class='+$(cell).attr('class')+
                  '>'+$(cell).html()+'</th>')
              else if $(cell).attr('style') is "display: none;"
                # ensures table has same number of columns in every row
                $(cell).detach()

            for cell, index in header_row2
              # replace <td> tags with <th> tags manually
              index += colOffset unless fixedTable
              classes = $(cell).attr('class')
              if that.pd.isIndexInCollection(index, 'expected') || that.pd.isIndexInCollection(index, 'actual')
                classes = classes + " rotate"

              $(cell).replaceWith('<th scope="col" class='+classes+'>'+$(cell).html()+'</th>')
        })

  openEditDialog: (e) =>
    rowIndex = @hot.getSelected()[0]
    patientIndex = rowIndex - @FIXED_ROWS
    patient = @measure.get('patients').models[patientIndex]
    @patientEditView.display(patient, @measure, @measure.get('patients'), @measure.collection)

  makeInlineEditable: (e) =>
    container = $(@hot.container).parent()
    rowIndex = @hot.getSelected()[0]
    for table in $(container).find('table')
      tr = $(table).find('tr[data-row="row' + rowIndex.toString() + '"]').get(0)
      if tr
        if $(tr).hasClass('inline-edit-mode')
          Handsontable.Dom.removeClass(tr, 'inline-edit-mode')
          @editableRows = @editableRows.filter (index) -> index != rowIndex
        else
          Handsontable.Dom.addClass(tr, 'inline-edit-mode')
          @editableRows.push(rowIndex)

    for col in @editableCols
      if rowIndex in @editableRows
        @hot.setCellMeta(rowIndex, col, 'readOnly', false)
      else
        @hot.setCellMeta(rowIndex, col, 'readOnly', true)

  header1Renderer: (instance, td, row, col, value, cellProperties) =>
    Handsontable.renderers.TextRenderer.apply(this, arguments)
    @addDiv(td)
    @getColor(instance, td, row, col, value, cellProperties)

  header2Renderer: (instance, td, row, col, value, cellProperties) =>
    Handsontable.renderers.TextRenderer.apply(this, arguments)
    if @pd.isIndexInCollection(col, 'actions')
      Handsontable.Dom.addClass(td, 'action')
    if @pd.isIndexInCollection(col, 'expected') || @pd.isIndexInCollection(col, 'actual')
      @addDiv(td)
    else
      @addScroll(td)

  dataRenderer: (instance, td, row, col, value, cellProperties) =>
    Handsontable.renderers.TextRenderer.apply(this, arguments)
    Handsontable.Dom.addClass(td, 'content')
    if @pd.isIndexInCollection(col, 'actions')
      Handsontable.Dom.addClass(td, 'action')

    # TODO: this is a hack to show discrepencies with expected/actual. work out better way to do this
    cellText = td.textContent
    if cellText.indexOf("__WARN__") == 0
      cellText = cellText.substring("__WARN__".length)
      td.textContent = cellText
      Handsontable.Dom.addClass(td, 'warn')

    if @pd.isIndexDataCriteria(col)
      @addDataCriteriaDiv(td)
    else
      @addDiv(td)

    # add row index identifier
    # TODO: is this still necessary without the expandable rows?
    tr = td.parentElement
    $(tr).attr('data-row', "row" + row)

    # enabling edit modes for the table
    if row in @editableRows
      Handsontable.Dom.addClass(tr, 'inline-edit-mode')
      if col in @editableCols
        instance.setCellMeta(row, col, 'readOnly', false)
    if col in @editableCols
      Handsontable.Dom.addClass(td, 'editable')

  getColor: (instance, td, row, col, value, cellProperties) =>
    for population in @populations
      if @pd.isIndexInCollection(col, population)
        Handsontable.Dom.addClass(td, population.toLowerCase())

  addDataCriteriaDiv: (element) =>
    text = element.textContent
    element.firstChild.remove()
    if text == 'FALSE'
      $(element).append('<div class="text-danger"><i aria-hidden="true" class="fa fa-fw fa-times-circle"></i> ' + text + '</div>')
    else if text == 'TRUE'
      $(element).append('<div class="text-success"><i aria-hidden="true" class="fa fa-fw fa-check-circle"></i> ' + text + '</div>')
    else if text.indexOf('SPECIFIC') >= 0
      $(element).append('<div class="text-danger"><i aria-hidden="true" class="fa fa-fw fa-asterisk"></i> ' + text + '</div>')

  addDiv: (element) =>
    text = element.textContent
    element.firstChild.remove()
    $(element).append('<div>' + text + '</div>')

  addScroll: (element) =>
    text = element.textContent
    element.firstChild.remove()
    $(element).append('<div class="tableScrollContainer"><div class="tableScroll">' + text + '</div></div>')

  getColWidths2: ()  =>
    colWidths = []
    for dataKey in @pd.dataIndices
      colWidths.push({"width": @pd.getWidth(dataKey).toString() + "px"})
    colWidths
    
  getColWidths: ()  =>
    colWidths = []
    for dataKey in @pd.dataIndices
      colWidths.push(@pd.getWidth(dataKey))
    colWidths

  createData: (patients) =>
    data = []
    headers = @createHeaderRows(patients)
    data.push(headers[0])
    data.push(headers[1])

    @createPatientRows(patients, data)

    return data

  createMergedCells: (measure, patients) =>
    mergedCells = []

    for key, dataCollection of @pd.dataCollections
      if dataCollection.items.length > 0
        length = dataCollection.items.length
        mergedCells.push({row:0, col:dataCollection.firstIndex, colspan: length, rowspan: 1})

    return mergedCells

  # TODO: this should be done differently and more dynamically
  getFixedColumnCount: () =>
    @pd.getCollectionLastIndex('expected') + 1

  getEditableCols:() =>
    #editableFields = ["first", "last", "notes", "birthdate", "ethnicity", "race", "gender", "deathdate"]
    editableFields = ["first", "last", "notes", "birthdate", "gender", "deathdate"]
    editableCols = []

    for editableField in editableFields
      editableCols.push(@pd.getIndex(editableField))

    # make expected population results editable
    for population in @populations
      editableCols.push(@pd.getIndex('expected' + population))

    return editableCols

  createHeaderRows: (patients) =>
    row1 = []
    row2 = []

    for data in @pd.dataIndices
      row2.push(@pd.getName(data))

    row1.push('') for i in [1..row2.length]

    for key, dataCollection of @pd.dataCollections
      row1[dataCollection.firstIndex] = dataCollection.name

    [row1, row2]

  createPatientRows: (patients, data) =>
    for patient, i in patients.models
      patientRow = @createPatientRow(patient);
      data.push(patientRow);

  createPatientRow: (patient) =>
    patient_values = []

    patient_result = @matchPatientToPatientId(patient.id)

    expectedResults = @getExpectedResults(patient)
    actualResults = @getActualResults(patient_result)

    for dataType in @pd.dataIndices
      key = @pd.getRealKey(dataType)
      # TODO: How to make these buttons trigger events??
      if dataType == 'edit'
        patient_values.push('
          <button class="btn btn-xs btn-primary" data-call-method="makeInlineEditable">
            <i aria-hidden="true" class="fa fa-fw fa-pencil"></i>
            <span class="sr-only">Edit this patient inline</span>
          </button>')
      else if dataType == 'open'
        patient_values.push('
          <button class="btn btn-xs btn-default" data-call-method="openEditDialog">Open...</button>')
      else if dataType == 'result'
        patient_values.push(@isPatientPassing(expectedResults, actualResults))
      else if @pd.isExpectedValue(dataType)
        value = expectedResults[key]
        if value != actualResults[key]
          value = "__WARN__" + value # TODO: this is a hack to show discrepencies with expected/actual. work out better way to do this
        patient_values.push(value)
      else if @pd.isActualValue(dataType)
        value = actualResults[key]
        if value != expectedResults[key]
          value = "__WARN__" + value # TODO: this is a hack to show discrepencies with expected/actual. work out better way to do this
        patient_values.push(value)
      # else if dataType == 'ethnicity'
      #   patient_values.push(@ethnicity_map[patient.get(key)])
      # else if dataType == 'race'
      #   patient_values.push(@race_map[patient.get(key)])
      else if (key == 'birthdate' || key == 'deathdate') && patient.get(key) != null
        patient_values.push(moment.utc(patient.get(key), 'X').format('L'))
      else if @pd.isCriteria(dataType)
        population = @pd.getCriteriaPopulation(dataType)
        patient_values.push(@getPatientCriteriaResult(key, population, patient_result))
      else
        patient_values.push(patient.get(dataType))

    patient_values

  matchPatientToPatientId: (patient_id) =>
    patients = @patientResults
    # Iterate over each of the patients to match the patient_id
    patient = (patient for patient in patients when patient.patient_id == patient_id)[0]

  isPatientPassing: (expectedResults, actualResults) =>
    for population in @populations
      if expectedResults[population] != actualResults[population]
        return 'FALSE'
    return 'TRUE'

  getExpectedResults: (patient) =>
    expectedResults = {}
    expected_model = (model for model in patient.get('expected_values').models when model.get('measure_id') == @measure.get('hqmf_set_id') && model.get('population_index') == @population.get('index'))[0]

    for population in @populations
      if population not in expected_model.keys()
        expectedResults[population] = ' '
      else
        expectedResults[population] = expected_model.get(population)

    expectedResults

  getActualResults: (patient_result) =>
    actualResults = {}

    for population in @populations
      # TODO: check this logic
      if population == 'OBSERV'
        if 'values' of patient_result && population of patient_result['rationale']
          actualResults[population] = patient_result['values'].toString()
        else
          actualResults[population] = 0
        if !actualResults[population]
          # TODO: if the OBSERV value was undefined, the rendering messed up previously.
          # this fixes that but we should potentially take another approach.
          # e.g. make it so a cell can better handle an empty value. Put something other than a blank here. Etc.
          actualResults[population] = " "
      else if population of patient_result
        actualResults[population] = patient_result[population]
      else
        actualResults[population] = ' '

    actualResults

  getPatientCriteriaResult: (criteriaKey, population, patientResult) =>
    # TODO: check this logic
    if criteriaKey of patientResult['rationale']
      value = patientResult['rationale'][criteriaKey]
      if value != null && value != 'false' && value != false
        result = 'TRUE'
      else if value == 'false' || value == false
        result = 'FALSE'

      value = result

      if 'specificsRationale' of patientResult && population of patientResult['specificsRationale']
        specific_value = patientResult['specificsRationale'][population][criteriaKey]
        if specific_value == false  && value == 'TRUE'
          result = 'SPECIFICALLY FALSE'
        else if specific_value == true && value == 'FALSE'
          result = 'SPECIFICALLY TRUE'

    else
      result = ''

    result

###################################################################################

  createPatientDetailRow: (patient, rowIndex, patientSummaryRow) =>
    row = [];
    for value in patientSummaryRow
      row.push("DETAIL " + rowIndex.toString())
    return row

class Thorax.Views.MeasurePatientEditModal extends Thorax.Views.BonnieView
  template: JST['measure/patient_edit_modal']

  events:
    'ready': 'setup'

  setup: ->
    @editDialog = @$("#patientEditModal")

  display: (model, measure, patients, measures) ->
    @patientBuilderView = new Thorax.Views.PatientBuilder(model: model, measure: measure, patients: patients, measures: measures, showCompleteView: false)
    @patientBuilderView.appendTo(@$('.modal-body'))
    @editDialog.modal(
      "backdrop" : "static",
      "keyboard" : true,
      "show" : true).find('.modal-dialog').css('width','80%') # The same width defined in $modal-lg

  save: (e)->
    @patientBuilderView.save(e)
    @editDialog.modal('hide')
    @$('.modal-body').empty() # clear out patientBuilderView
    @dashboard.createTable()

  close: -> 
    @$('.modal-body').empty() # clear out patientBuilderView
