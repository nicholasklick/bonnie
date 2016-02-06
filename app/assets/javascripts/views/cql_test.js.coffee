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
            "name" : "PatientAge",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
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
            }
         }, {
            "name" : "PatientOver40",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "Greater",
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
                  "value" : "40",
                  "type" : "Literal"
               } ]
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
            "name" : "MeasurementPeriodIschemicStroke",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "Query",
               "source" : [ {
                  "alias" : "IS",
                  "expression" : {
                     "name" : "IschemicStroke",
                     "type" : "ExpressionRef"
                  }
               } ],
               "relationship" : [ ],
               "where" : {
                  "type" : "In",
                  "operand" : [ {
                     "path" : "start datetime",
                     "scope" : "IS",
                     "type" : "Property"
                  }, {
                     "name" : "MeasurementPeriod",
                     "type" : "ParameterRef"
                  } ]
               }
            }
         }, {
            "name" : "MeasurementPeriodIschemicStroke2",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "Query",
               "source" : [ {
                  "alias" : "IS",
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
               } ],
               "relationship" : [ ],
               "where" : {
                  "type" : "In",
                  "operand" : [ {
                     "path" : "start datetime",
                     "scope" : "IS",
                     "type" : "Property"
                  }, {
                     "name" : "MeasurementPeriod",
                     "type" : "ParameterRef"
                  } ]
               }
            }
         } ]
      }
   }
}

class WrappedCondition
  constructor: (@condition) ->
  getCode: ->
    allCodes = []
    for system, codes of @condition.codes
      for code in codes
        allCodes.push code: code, system: system
    allCodes
  toString: -> "#{@condition.description} (#{moment.utc(@condition.start_time, 'X').format('L LT')})"

class WrappedPatient
  constructor: (@patient) ->
  id: -> @patient.id
  findRecords: (profile) ->
    switch profile
      when 'Patient'
        [{ 'birth datetime': { toJSDate: => moment.utc(@patient.get('birthdate'), 'X').toDate() } }]
      when 'DiagnosisActive'
        _(@patient.get('conditions')).map (c) -> new WrappedCondition(c)

class PatientSource
  constructor: (@patients) -> @index = 0
  currentPatient: -> new WrappedPatient(@patients.at(@index)) if @patients.at(@index)
  nextPatient: -> @index += 1

class Thorax.Views.CqlTestView extends Thorax.Views.BonnieView

  template: JST['cql_test']

  initialize: ->
    patientSource = new PatientSource(@collection)
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
