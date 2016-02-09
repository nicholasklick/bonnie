elm = {
   "library" : {
      "identifier" : {
         "id" : "TinyQDM",
         "version" : "4"
      },
      "schemaIdentifier" : {
         "id" : "urn:hl7-org:elm",
         "version" : "r1"
      },
      "usings" : {
         "def" : [ {
            "localIdentifier" : "System",
            "uri" : "urn:hl7-org:elm-types:r1"
         }, {
            "localIdentifier" : "QDM",
            "uri" : "urn:healthit-gov:qdm:v4_1_2"
         } ]
      },
      "parameters" : {
         "def" : [ {
            "name" : "MeasurementPeriod",
            "accessLevel" : "Public",
            "default" : {
               "lowClosed" : true,
               "highClosed" : false,
               "type" : "Interval",
               "low" : {
                  "type" : "DateTime",
                  "year" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "2012",
                     "type" : "Literal"
                  },
                  "month" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "1",
                     "type" : "Literal"
                  },
                  "day" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "1",
                     "type" : "Literal"
                  },
                  "hour" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  },
                  "minute" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  },
                  "second" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  },
                  "millisecond" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  }
               },
               "high" : {
                  "type" : "DateTime",
                  "year" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "2013",
                     "type" : "Literal"
                  },
                  "month" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "1",
                     "type" : "Literal"
                  },
                  "day" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "1",
                     "type" : "Literal"
                  },
                  "hour" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  },
                  "minute" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  },
                  "second" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  },
                  "millisecond" : {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  }
               }
            }
         } ]
      },
      "valueSets" : {
         "def" : [ {
            "name" : "Ischemic Stroke",
            "id" : "2.16.840.1.113883.3.117.1.7.1.247",
            "accessLevel" : "Public"
         }, {
            "name" : "Inpatient Encounter",
            "id" : "2.16.840.1.113883.3.464.1003.101.12.1060",
            "accessLevel" : "Public"
         }, {
            "name" : "Antithrombotic Therapy",
            "id" : "2.16.840.1.113883.3.117.1.7.1.201",
            "accessLevel" : "Public"
         } ]
      },
      "statements" : {
         "def" : [ {
            "name" : "Patient",
            "context" : "Patient",
            "expression" : {
               "type" : "SingletonFrom",
               "operand" : {
                  "dataType" : "{urn:healthit-gov:qdm:v4_1_2}Patient",
                  "templateId" : "Patient",
                  "type" : "Retrieve"
               }
            }
         }, {
            "name" : "OverEighteen",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "GreaterOrEqual",
               "operand" : [ {
                  "precision" : "Year",
                  "type" : "CalculateAgeAt",
                  "operand" : [ {
                     "path" : "birth datetime",
                     "type" : "Property",
                     "source" : {
                        "name" : "Patient",
                        "type" : "ExpressionRef"
                     }
                  }, {
                     "type" : "Start",
                     "operand" : {
                        "name" : "MeasurementPeriod",
                        "type" : "ParameterRef"
                     }
                  } ]
               }, {
                  "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                  "value" : "18",
                  "type" : "Literal"
               } ]
            }
         }, {
            "name" : "Encounters",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "Query",
               "source" : [ {
                  "alias" : "E",
                  "expression" : {
                     "dataType" : "{urn:healthit-gov:qdm:v4_1_2}EncounterPerformed",
                     "templateId" : "EncounterPerformed",
                     "codeProperty" : "code",
                     "type" : "Retrieve",
                     "codes" : {
                        "name" : "Inpatient Encounter",
                        "type" : "ValueSetRef"
                     }
                  }
               } ],
               "relationship" : [ ],
               "where" : {
                  "type" : "In",
                  "operand" : [ {
                     "path" : "start datetime",
                     "scope" : "E",
                     "type" : "Property"
                  }, {
                     "name" : "MeasurementPeriod",
                     "type" : "ParameterRef"
                  } ]
               }
            }
         }, {
            "name" : "IschemicStroke",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "dataType" : "{urn:healthit-gov:qdm:v4_1_2}DiagnosisActive",
               "templateId" : "DiagnosisActive",
               "codeProperty" : "code",
               "type" : "Retrieve",
               "codes" : {
                  "name" : "Ischemic Stroke",
                  "type" : "ValueSetRef"
               }
            }
         }, {
            "name" : "EncountersWithIschemicStroke",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "Query",
               "source" : [ {
                  "alias" : "E",
                  "expression" : {
                     "name" : "Encounters",
                     "type" : "ExpressionRef"
                  }
               } ],
               "relationship" : [ {
                  "alias" : "D",
                  "type" : "With",
                  "expression" : {
                     "name" : "IschemicStroke",
                     "type" : "ExpressionRef"
                  },
                  "suchThat" : {
                     "type" : "Contains",
                     "operand" : [ {
                        "lowClosed" : true,
                        "highClosed" : true,
                        "type" : "Interval",
                        "low" : {
                           "path" : "start datetime",
                           "scope" : "E",
                           "type" : "Property"
                        },
                        "high" : {
                           "path" : "stop datetime",
                           "scope" : "E",
                           "type" : "Property"
                        }
                     }, {
                        "path" : "start datetime",
                        "scope" : "D",
                        "type" : "Property"
                     } ]
                  }
               } ]
            }
         }, {
            "name" : "Denominator",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "And",
               "operand" : [ {
                  "name" : "OverEighteen",
                  "type" : "ExpressionRef"
               }, {
                  "type" : "Greater",
                  "operand" : [ {
                     "type" : "Count",
                     "source" : {
                        "name" : "EncountersWithIschemicStroke",
                        "type" : "ExpressionRef"
                     }
                  }, {
                     "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  } ]
               } ]
            }
         }, {
            "name" : "MedicationDuringEncounter",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "Query",
               "source" : [ {
                  "alias" : "M",
                  "expression" : {
                     "dataType" : "{urn:healthit-gov:qdm:v4_1_2}MedicationDischarge",
                     "templateId" : "MedicationDischarge",
                     "codeProperty" : "code",
                     "type" : "Retrieve",
                     "codes" : {
                        "name" : "Antithrombotic Therapy",
                        "type" : "ValueSetRef"
                     }
                  }
               } ],
               "relationship" : [ {
                  "alias" : "E",
                  "type" : "With",
                  "expression" : {
                     "name" : "EncountersWithIschemicStroke",
                     "type" : "ExpressionRef"
                  },
                  "suchThat" : {
                     "type" : "Contains",
                     "operand" : [ {
                        "lowClosed" : true,
                        "highClosed" : true,
                        "type" : "Interval",
                        "low" : {
                           "path" : "start datetime",
                           "scope" : "E",
                           "type" : "Property"
                        },
                        "high" : {
                           "path" : "stop datetime",
                           "scope" : "E",
                           "type" : "Property"
                        }
                     }, {
                        "path" : "start datetime",
                        "scope" : "M",
                        "type" : "Property"
                     } ]
                  }
               } ]
            }
         }, {
            "name" : "Numerator",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "Greater",
               "operand" : [ {
                  "type" : "Count",
                  "source" : {
                     "name" : "MedicationDuringEncounter",
                     "type" : "ExpressionRef"
                  }
               }, {
                  "valueType" : "{urn:hl7-org:elm-types:r1}Integer",
                  "value" : "0",
                  "type" : "Literal"
               } ]
            }
         } ]
      }
   }
}

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
    patientSource = new PatientSource(@collection)
    debugger
    @results = executeSimpleELM(elm, patientSource, @valueSetsForCodeService())

  resultKeys: ->
    # Assume first result is representative of keys
    resultValues = _(@results.patientResults).values()
    return [] unless resultValues.length > 0
    resultKeys = _(resultValues[0]).keys()
    _(resultKeys).without('Patient') # The Patient record is included

  context: ->
    _(super).extend headers: @resultKeys()

  patientContext: (p) ->
    patientResults = @results.patientResults[p.id]
    _(p.toJSON()).extend values: _(@resultKeys()).map (key) -> patientResults[key]

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
