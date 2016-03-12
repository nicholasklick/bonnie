class Thorax.Views.MeasurePatientDashboard extends Thorax.Views.BonnieView

  template: JST['measure/patient_dashboard']

  initialize: ->
    @demoMeasure = {"ipp":{"ippCol_0":"Patient Characteristic Birthdate: Birth Date >= 18 years starts before start of \"Measurement Period\"","ippCol_1":"Diagnosis: Primary Open-Angle Glaucoma overlaps Occurrence A: $EyeCareEncounters","ippCol_2":"Occurrence A: $EyeCareEncounters","ippCol_3":"Union of: Encounter, Performed: Ophthalmological Services Encounter, Performed: Care Services in Long-Term Residential Facility Encounter, Performed: Nursing Facility Visit Encounter, Performed: Office Visit Encounter, Performed: Outpatient Consultation Encounter, Performed: Face-to-Face Interaction during \"Measurement Period\"","ippCol_4":"Encounter, Performed: Ophthalmological Services","ippCol_5":"Encounter, Performed: Care Services in Long-Term Residential Facility","ippCol_6":"Encounter, Performed: Nursing Facility Visit","ippCol_7":"Encounter, Performed: Office Visit","ippCol_8":"Encounter, Performed: Outpatient Consultation","ippCol_9":"Encounter, Performed: Face-to-Face Interaction"},"numer":{"numerCol_0":"Diagnostic Study, Performed: Cup to Disc Ratio(result) during Occurrence A: $EyeCareEncounters","numerCol_1":"Occurrence A: $EyeCareEncounters","numerCol_2":"Union of: Encounter, Performed: Ophthalmological Services Encounter, Performed: Care Services in Long-Term Residential Facility Encounter, Performed: Nursing Facility Visit Encounter, Performed: Office Visit Encounter, Performed: Outpatient Consultation Encounter, Performed: Face-to-Face Interaction during \"Measurement Period\"","numerCol_3":"Encounter, Performed: Ophthalmological Services","numerCol_4":"Encounter, Performed: Care Services in Long-Term Residential Facility","numerCol_5":"Encounter, Performed: Nursing Facility Visit","numerCol_6":"Encounter, Performed: Office Visit","numerCol_7":"Encounter, Performed: Outpatient Consultation","numerCol_8":"Encounter, Performed: Face-to-Face Interaction","numerCol_9":"Diagnostic Study, Performed: Optic Disc Exam for Structural Abnormalities(result) during Occurrence A: $EyeCareEncounters","numerCol_10":"Occurrence A: $EyeCareEncounters","numerCol_11":"Union of: Encounter, Performed: Ophthalmological Services Encounter, Performed: Care Services in Long-Term Residential Facility Encounter, Performed: Nursing Facility Visit Encounter, Performed: Office Visit Encounter, Performed: Outpatient Consultation Encounter, Performed: Face-to-Face Interaction during \"Measurement Period\"","numerCol_12":"Encounter, Performed: Ophthalmological Services","numerCol_13":"Encounter, Performed: Care Services in Long-Term Residential Facility","numerCol_14":"Encounter, Performed: Nursing Facility Visit","numerCol_15":"Encounter, Performed: Office Visit","numerCol_16":"Encounter, Performed: Outpatient Consultation","numerCol_17":"Encounter, Performed: Face-to-Face Interaction","numerCol_18":"Union of: Diagnostic Study, Performed: Cup to Disc Ratio ( Not Done : Medical Reason ) Diagnostic Study, Performed: Optic Disc Exam for Structural Abnormalities ( Not Done : Medical Reason ) starts during Occurrence A: $EyeCareEncounters","numerCol_19":"Diagnostic Study, Performed: Cup to Disc Ratio ( Not Done : Medical Reason )"},"denexcep":{"denexcepCol_0":"Diagnostic Study, Performed: Optic Disc Exam for Structural Abnormalities ( Not Done : Medical Reason )","denexcepCol_1":"Occurrence A: $EyeCareEncounters","denexcepCol_2":"Union of: Encounter, Performed: Ophthalmological Services Encounter, Performed: Care Services in Long-Term Residential Facility Encounter, Performed: Nursing Facility Visit Encounter, Performed: Office Visit Encounter, Performed: Outpatient Consultation Encounter, Performed: Face-to-Face Interaction during \"Measurement Period\"","denexcepCol_3":"Encounter, Performed: Ophthalmological Services","denexcepCol_4":"Encounter, Performed: Care Services in Long-Term Residential Facility","denexcepCol_5":"Encounter, Performed: Nursing Facility Visit","denexcepCol_6":"Encounter, Performed: Office Visit","denexcepCol_7":"Encounter, Performed: Outpatient Consultation","denexcepCol_8":"Encounter, Performed: Face-to-Face Interaction"},"denom":{}};
    @demoPatients = [{"firstName":"Zelda","lastName":"TESTArnold","expected":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"12/31/1994","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"FALSE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"","numerCol_19":""},"denexcep":{"denexcepCol_0":"","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Xander","lastName":"TESTClay","expected":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"04/13/1986","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"FALSE","ippCol_2":"FALSE","ippCol_3":"FALSE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"","numerCol_1":"FALSE","numerCol_2":"FALSE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"","numerCol_10":"FALSE","numerCol_11":"FALSE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"","numerCol_19":""},"denexcep":{"denexcepCol_0":"","denexcepCol_1":"FALSE","denexcepCol_2":"FALSE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Veronica","lastName":"TESTEldridge","expected":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"04/13/1976","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"FALSE","ippCol_2":"FALSE","ippCol_3":"FALSE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"TRUE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"","numerCol_1":"FALSE","numerCol_2":"FALSE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"TRUE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"","numerCol_10":"FALSE","numerCol_11":"FALSE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"TRUE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"","numerCol_19":""},"denexcep":{"denexcepCol_0":"","denexcepCol_1":"FALSE","denexcepCol_2":"FALSE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"TRUE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Udi","lastName":"TESTFranklin","expected":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"05/14/1971","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"FALSE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"FALSE","ippCol_8":"TRUE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"FALSE","numerCol_7":"TRUE","numerCol_8":"FALSE","numerCol_9":"","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"FALSE","numerCol_16":"TRUE","numerCol_17":"FALSE","numerCol_18":"","numerCol_19":""},"denexcep":{"denexcepCol_0":"","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"FALSE","denexcepCol_7":"TRUE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Trudie","lastName":"TESTGermaine","expected":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"06/14/1966","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"FALSE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"","numerCol_19":""},"denexcep":{"denexcepCol_0":"","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Penelope","lastName":"TESTKessington","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"09/18/1946","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"TRUE","ippCol_6":"FALSE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"TRUE","numerCol_5":"FALSE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"TRUE","numerCol_14":"FALSE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"TRUE","denexcepCol_5":"FALSE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Hilda","lastName":"TESTSalinger","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"03/11/1981","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"George","lastName":"TESTTrotsky","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"04/12/1976","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"TRUE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Quin","lastName":"TESTJackson","expected":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"09/18/1951","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"FALSE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"TRUE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"TRUE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"TRUE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"","numerCol_19":""},"denexcep":{"denexcepCol_0":"","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"TRUE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Otis","lastName":"TESTLightner","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"09/17/1941","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"FALSE","ippCol_8":"TRUE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"FALSE","numerCol_7":"TRUE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"FALSE","numerCol_16":"TRUE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"FALSE","denexcepCol_7":"TRUE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Manny","lastName":"TESTNolan","expected":{"IPP":"1","DENOM":"1","NUMER":"1","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"1","DENEXCEP":"0"},"notes":"","birthdate":"10/17/1937","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"TRUE"},"numer":{"numerCol_0":"TRUE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"TRUE","numerCol_9":"TRUE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"TRUE","numerCol_18":"TRUE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"TRUE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"TRUE"},"denom":{},"DENEXCEP":{}},{"firstName":"Jane","lastName":"TESTQuasay","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"notes":"","birthdate":"01/10/1992","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"TRUE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"TRUE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"TRUE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"TRUE","numerCol_19":"TRUE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"TRUE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Fergie","lastName":"TESTUnderhill","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"05/13/1971","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Edward","lastName":"TESTVance","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"notes":"","birthdate":"06/14/1966","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"TRUE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"TRUE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Denise","lastName":"TESTWest","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"notes":"","birthdate":"08/16/1956","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"TRUE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"TRUE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"TRUE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"TRUE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"TRUE","numerCol_19":"TRUE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"TRUE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Keith","lastName":"TESTPaulson","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"notes":"","birthdate":"11/18/1927","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"TRUE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"TRUE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"TRUE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"TRUE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"TRUE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"TRUE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Ian","lastName":"TESTRutenbeck","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"04/13/1986","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"TRUE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Curtis","lastName":"TESTXiao","expected":{"IPP":"1","DENOM":"1","NUMER":"1","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"1","DENEXCEP":"0"},"notes":"","birthdate":"08/16/1951","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"TRUE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"TRUE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Linda","lastName":"TESTOppenheimer","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"11/18/1932","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"TRUE"},"denexcep":{"denexcepCol_0":"TRUE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Zelda","lastName":"TESTArnold","expected":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"12/31/1994","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"FALSE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"","numerCol_19":""},"denexcep":{"denexcepCol_0":"","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Xander","lastName":"TESTClay","expected":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"04/13/1986","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"FALSE","ippCol_2":"FALSE","ippCol_3":"FALSE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"","numerCol_1":"FALSE","numerCol_2":"FALSE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"","numerCol_10":"FALSE","numerCol_11":"FALSE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"","numerCol_19":""},"denexcep":{"denexcepCol_0":"","denexcepCol_1":"FALSE","denexcepCol_2":"FALSE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Veronica","lastName":"TESTEldridge","expected":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"04/13/1976","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"FALSE","ippCol_2":"FALSE","ippCol_3":"FALSE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"TRUE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"","numerCol_1":"FALSE","numerCol_2":"FALSE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"TRUE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"","numerCol_10":"FALSE","numerCol_11":"FALSE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"TRUE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"","numerCol_19":""},"denexcep":{"denexcepCol_0":"","denexcepCol_1":"FALSE","denexcepCol_2":"FALSE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"TRUE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Udi","lastName":"TESTFranklin","expected":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"05/14/1971","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"FALSE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"FALSE","ippCol_8":"TRUE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"FALSE","numerCol_7":"TRUE","numerCol_8":"FALSE","numerCol_9":"","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"FALSE","numerCol_16":"TRUE","numerCol_17":"FALSE","numerCol_18":"","numerCol_19":""},"denexcep":{"denexcepCol_0":"","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"FALSE","denexcepCol_7":"TRUE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Trudie","lastName":"TESTGermaine","expected":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"06/14/1966","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"FALSE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"","numerCol_19":""},"denexcep":{"denexcepCol_0":"","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Penelope","lastName":"TESTKessington","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"09/18/1946","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"TRUE","ippCol_6":"FALSE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"TRUE","numerCol_5":"FALSE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"TRUE","numerCol_14":"FALSE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"TRUE","denexcepCol_5":"FALSE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Hilda","lastName":"TESTSalinger","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"03/11/1981","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"George","lastName":"TESTTrotsky","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"04/12/1976","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"TRUE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Quin","lastName":"TESTJackson","expected":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"0","DENOM":"0","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"09/18/1951","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"FALSE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"TRUE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"TRUE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"TRUE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"","numerCol_19":""},"denexcep":{"denexcepCol_0":"","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"TRUE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Otis","lastName":"TESTLightner","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"09/17/1941","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"FALSE","ippCol_8":"TRUE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"FALSE","numerCol_7":"TRUE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"FALSE","numerCol_16":"TRUE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"FALSE","denexcepCol_7":"TRUE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Manny","lastName":"TESTNolan","expected":{"IPP":"1","DENOM":"1","NUMER":"1","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"1","DENEXCEP":"0"},"notes":"","birthdate":"10/17/1937","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"TRUE"},"numer":{"numerCol_0":"TRUE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"TRUE","numerCol_9":"TRUE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"TRUE","numerCol_18":"TRUE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"TRUE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"TRUE"},"denom":{},"DENEXCEP":{}},{"firstName":"Jane","lastName":"TESTQuasay","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"notes":"","birthdate":"01/10/1992","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"TRUE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"TRUE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"TRUE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"TRUE","numerCol_19":"TRUE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"TRUE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Fergie","lastName":"TESTUnderhill","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"05/13/1971","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Edward","lastName":"TESTVance","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"notes":"","birthdate":"06/14/1966","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"TRUE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"TRUE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Denise","lastName":"TESTWest","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"notes":"","birthdate":"08/16/1956","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"TRUE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"TRUE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"TRUE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"TRUE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"TRUE","numerCol_19":"TRUE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"TRUE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Keith","lastName":"TESTPaulson","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"1"},"notes":"","birthdate":"11/18/1927","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"TRUE","ippCol_7":"FALSE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"TRUE","numerCol_6":"FALSE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"TRUE","numerCol_15":"FALSE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"TRUE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"TRUE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"TRUE","denexcepCol_6":"FALSE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Ian","lastName":"TESTRutenbeck","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"04/13/1986","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"TRUE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Curtis","lastName":"TESTXiao","expected":{"IPP":"1","DENOM":"1","NUMER":"1","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"1","DENEXCEP":"0"},"notes":"","birthdate":"08/16/1951","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"M","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"TRUE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"TRUE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"FALSE"},"denexcep":{"denexcepCol_0":"FALSE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}},{"firstName":"Linda","lastName":"TESTOppenheimer","expected":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"actual":{"IPP":"1","DENOM":"1","NUMER":"0","DENEXCEP":"0"},"notes":"","birthdate":"11/18/1932","expired":"","deathdate":"","ethnicity":"Not Hispanic or Latino","race":"American Indian or Alaska Native","gender":"F","ipp":{"ippCol_0":"TRUE","ippCol_1":"TRUE","ippCol_2":"TRUE","ippCol_3":"TRUE","ippCol_4":"FALSE","ippCol_5":"FALSE","ippCol_6":"FALSE","ippCol_7":"TRUE","ippCol_8":"FALSE","ippCol_9":"FALSE"},"numer":{"numerCol_0":"FALSE","numerCol_1":"TRUE","numerCol_2":"TRUE","numerCol_3":"FALSE","numerCol_4":"FALSE","numerCol_5":"FALSE","numerCol_6":"TRUE","numerCol_7":"FALSE","numerCol_8":"FALSE","numerCol_9":"FALSE","numerCol_10":"TRUE","numerCol_11":"TRUE","numerCol_12":"FALSE","numerCol_13":"FALSE","numerCol_14":"FALSE","numerCol_15":"TRUE","numerCol_16":"FALSE","numerCol_17":"FALSE","numerCol_18":"FALSE","numerCol_19":"TRUE"},"denexcep":{"denexcepCol_0":"TRUE","denexcepCol_1":"TRUE","denexcepCol_2":"TRUE","denexcepCol_3":"FALSE","denexcepCol_4":"FALSE","denexcepCol_5":"FALSE","denexcepCol_6":"TRUE","denexcepCol_7":"FALSE","denexcepCol_8":"FALSE"},"denom":{},"DENEXCEP":{}}];

    @dispIppColumns = []
    @dispNumerColumns = []
    @dispDenomColumns = []
    @dispDenexcepColumns = []

    @ippColumns = []
    @numerColumns = []
    @denomColumns = []
    @denexcepColumns = []
    
    @FIXED_ROWS = 2
    @FIXED_COLS = 6
    
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
      data: @createData(@demoMeasure, @demoPatients),
      colWidths: @getColWidths(),
      copyPaste: false, # need this to avoid 508 issue
      fixedRowsTop: @FIXED_ROWS,
      fixedColumnsLeft: @FIXED_COLS,
      mergeCells: @createMergedCells(@demoMeasure, @demoPatients),
      readOnly: true,
      readOnlyCellClassName: '', # avoid using the default .htDimmed... it'll just make the whole table grey.
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

    tableInstances = $(container).find('table')
    i = 0
    while i < tableInstances.length
      Handsontable.Dom.addClass tableInstances[i], 'table' # adding table-striped or table-condensed doesn't work here
      i++

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
    if col >= 2 && col <= 9
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
    if text == 'FALSE'
      $(element).append('<div class="text-danger"><i aria-hidden="true" class="fa fa-fw fa-times-circle"></i> ' + text + '</div>')
    else if text == 'TRUE'
      $(element).append('<div class="text-success"><i aria-hidden="true" class="fa fa-fw fa-check-circle"></i> ' + text + '</div>')
    else if text.indexOf('SPECIFIC') >= 0
      $(element).append('<div class="text-danger"><i aria-hidden="true" class="fa fa-fw fa-asterisk"></i> ' + text + '</div>')
    else
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
    colWidths.push(@COL_WIDTH_POPULATION) for [0..7]

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
    @getOptionalRows()
    data = []
    headers = @createHeaderRows(measure)
    data.push(headers[0])
    data.push(headers[1])
    
    @createPatientRows(patients, data)
    
    return data

  createMergedCells: (measure, patients) =>
    mergedCells = [{row:0, col:2, colspan:4, rowspan:1},{row:0, col:6, colspan:4, rowspan:1}]
    if @ippColumns.length > 0
      mergedCells.push({row: 0, col: @ippColumns[0], colspan: @ippColumns.length, rowspan:1})
    if @numerColumns.length > 0
      mergedCells.push({row: 0, col: @numerColumns[0], colspan: @numerColumns.length, rowspan:1})
    if @denomColumns.length > 0
      mergedCells.push({row: 0, col: @denomColumns[0], colspan: @denomColumns.length, rowspan:1})
    if @denexcepColumns.length > 0
      mergedCells.push({row: 0, col: @denexcepColumns[0], colspan: @denexcepColumns.length, rowspan:1})

    return mergedCells

  createHeaderRows: (measure) =>
    row1 = ['','','Expected','','','','Actual','','','','','','','','','','']
    row2 = ['First Name','Last Name','IPP','DENOM','NUMER','DENEXCEP','IPP','DENOM','NUMER','DENEXCEP','Notes','Birthdate','Expired','Deathdate','Ethnicity','Race','Gender']
    
    curColIndex = row2.length
    @createHeaderSegment(row1, row2, @dispIppColumns, measure.ipp, @ippColumns, curColIndex, "IPP")
    curColIndex = row2.length
    @createHeaderSegment(row1, row2, @dispNumerColumns, measure.numer, @numerColumns, curColIndex, "NUMER")
    curColIndex = row2.length
    @createHeaderSegment(row1, row2, @dispDenomColumns, measure.denom, @denomColumns, curColIndex, "DENOM")
    curColIndex = row2.length
    @createHeaderSegment(row1, row2, @dispDenexcepColumns, measure.denexcep, @denexcepColumns, curColIndex, "DENEXCEP")
    
    [row1, row2]

  createHeaderSegment: (row1, row2, useColumnsArray, measureColumns, colIndexArray, curColIndex, headerString) =>
    isFirstRow = true
    colIndexArray.length = 0
    for value in useColumnsArray
      if isFirstRow
        row1.push(headerString)
      else
        row1.push("")
      row2.push(measureColumns[value])
      colIndexArray.push(curColIndex)
      curColIndex++
      isFirstRow = false

  createPatientRows: (patients, data) =>
    for patient, i in patients
      patientRow = @createSinglePatientRow(patient);
      patientDetailRow = @createPatientDetailRow(patient, i, patientRow);
      data.push(patientRow);
      data.push(patientDetailRow);

  createPatientDetailRow: (patient, rowIndex, patientSummaryRow) =>
    row = [];
    for value in patientSummaryRow
      row.push("DETAIL " + rowIndex.toString())
    return row

  createSinglePatientRow: (patient) =>
    ret = [
      patient.firstName,
      patient.lastName,
      patient.expected.IPP,
      patient.expected.DENOM,
      patient.expected.NUMER,
      patient.expected.DENEXCEP,
      patient.actual.IPP,
      patient.actual.DENOM,
      patient.actual.NUMER,
      patient.actual.DENEXCEP,
      patient.notes,
      patient.birthdate,
      patient.expired,
      patient.deathdate,
      patient.ethnicity,
      patient.race,
      patient.gender
    ];
    
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
      "show" : true).find('.modal-dialog').css('width','900px') # The same width defined in $modal-lg

  save: (e)-> 
    status = @patientBuilderView.save(e)
    if status
      @editDialog.modal(
        "backdrop" : "static",
        "keyboard" : false,
        "show" : true)
      @editDialog.modal('hide')

  close: -> ''
