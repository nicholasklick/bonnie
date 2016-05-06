class Thorax.Views.PatientDashboardPatients extends Thorax.Views.BonnieView
  className: 'patient-dashboard-patients'
  template: JST['measure/dashboard/table']
  
  events:
    ready: ->
      $('.content').scroll (e) ->
        $('.fixed-col').scrollTop($('.content').scrollTop())
        $('.content2').scrollLeft($('.content').scrollLeft())
    
class Thorax.Views.PatientDashboardPatientBody extends Thorax.Views.BonnieView
  template: JST['measure/dashboard/patient_row_body']
  tagName: 'tr'
    
class Thorax.Views.PatientDashboardPatientSide extends Thorax.Views.BonnieView
  template: JST['measure/dashboard/patient_row_side']
  tagName: 'tr'

class Thorax.Views.PatientDashboardPatientBodyTable extends Thorax.Views.BonnieView
  template: JST['measure/dashboard/patient_table_body']
    
class Thorax.Views.PatientDashboardPatientSideTable extends Thorax.Views.BonnieView
  template: JST['measure/dashboard/patient_table_side']
