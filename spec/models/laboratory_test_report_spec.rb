RSpec.describe LaboratoryTestReport do
  let(:laboratory_test_report) { build :laboratory_test_report }
  let(:fhir_json) { FHIR_JSON }

  describe 'Sample instance generation' do
    it 'generates a valid instance from factory_bot' do
      expect(laboratory_test_report).to be_valid
    end
  end

  describe 'parser' do
    it 'parse HL7 FHIR json' do
      expect(LaboratoryTestReport.from_fhir_json(FHIR_JSON).test_name).to eq '生化学検査'
    end

    it 'parse FLAT JSON of openEHR' do
      expect(LaboratoryTestReport.from_flat_json(FLAT_JSON).test_name).to eq '生化学検査'
    end
  end

end

FHIR_JSON = <<~JSON
{
  "resourceType": "DiagnosticReport",
  "id": "jp-diagnosticreport-labresult-example-1",
  "meta": {
    "profile": [
        "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_LabResult"
      ]
    },
    "text": {
      "status": "generated",
      "div" : "中略"
    },
    "contained": [
      {
        "resourceType": "Observation",
          "id": "inner-observation-labresult-1",
          "meta": {
            "profile": [
              "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_LabResult"
            ]
          },
          "status": "final",
          "category": [
            {
              "coding": [
                {
                  "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_SimpleObservationCategory_CS",
                  "code": "laboratory"
                }
              ]
            }
          ],
          "code": {
            "coding": [
              {
                "system": "https://fhir.loinc.org",
                "code": "26464-8",
                "display": " Leukocytes [#/volume] in Blood"
              }
            ],
            "text": "白血球数"
          },
          "subject": {
            "reference": "Patient/jp-patient-example-1"
          },
          "effectiveDateTime": "2024-06-06T08:30:00+09:00",
          "performer": [
            {
              "reference": "Organization/jp-organization-example-hospital",
              "display": "Nagara hospital"
            }
          ],
          "valueQuantity": {
            "value": 6.8,
            "unit": "10*3/uL",
            "system": "http://unitsofmeasure.org",
            "code": "10*3/uL"
          },
          "specimen": {
            "reference": "Specimen/jp-specimen-example-2"
          },
          "referenceRange": [
            {
              "low": {
                "value": 3.2,
                "unit": "10*3/uL",
                "system": "http://unitsofmeasure.org",
                "code": "10*3/uL"
              },
              "high": {
                "value": 9.8,
                "unit": "10*3/uL",
                "system": "http://unitsofmeasure.org",
                "code": "10*3/uL"
              }
            }
          ]
        },
      {
        "resourceType": "Observation",
          "id": "inner-observation-labresult-2",
          "meta": {
            "profile": [
              "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_LabResult"
            ]
          },
          "status": "final",
          "category": [
            {
              "coding": [
                {
                  "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_SimpleObservationCategory_CS",
                  "code": "laboratory"
                }
              ]
            }
          ],
          "code": {
            "coding": [
              {
                "system": "https://fhir.loinc.org",
                "code": "26453-1",
                "display": "Erythrocytes [#/volume] in Blood"
              }
            ],
            "text": "赤血球数"
          },
          "subject": {
            "reference": "Patient/jp-patient-example-1"
          },
          "effectiveDateTime": "2024-06-06T08:30:00+09:00",
          "performer": [
            {
              "reference": "Organization/jp-organization-example-hospital",
              "display": "Nagara hospital"
            }
          ],
          "valueQuantity": {
            "value": 4.05,
            "unit": "10*6/uL",
            "system": "http://unitsofmeasure.org",
            "code": "10*6/uL"
          },
          "specimen": {
            "reference": "Specimen/jp-specimen-example-2"
          },
          "referenceRange": [
            {
              "low": {
                "value": 4.0,
                "unit": "10*6/uL",
                "system": "http://unitsofmeasure.org",
                "code": "10*6/uL"
              },
              "high": {
                "value": 5.7,
                "unit": "10*6/uL",
                "system": "http://unitsofmeasure.org",
                "code": "10*6/uL"
              }
            }
          ]
        },
        {
          "resourceType": "Observation",
          "id": "inner-observation-labresult-3",
          "meta": {
            "profile": [
              "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_LabResult"
            ]
          },
          "status": "final",
          "category": [
            {
              "coding": [
                {
                  "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_SimpleObservationCategory_CS",
                  "code": "laboratory"
                }
              ]
            }
          ],
          "code": {
             "coding": [
              {
                "system": "https://fhir.loinc.org",
                "code": "718-7",
                "display": "Hemoglobin [Mass/volume] in Blood" 
              }
            ],
            "text": "血色素量"
          },
            "subject": {
                "reference": "Patient/jp-patient-example-1"
            },
            "effectiveDateTime": "2024-06-06T08:30:00+09:00",
            "performer": [
                {
                    "reference": "Organization/jp-organization-example-hospital",
                    "display": "Nagara hospital"
                }
            ],
            "valueQuantity": {
                "value": 13.0,
                "unit": "g/dL",
                "system": "http://unitsofmeasure.org",
                "code": "g/dL"
            },
            "specimen": {
                "reference": "Specimen/jp-specimen-example-2"
            },
            "referenceRange": [
                {
                    "low": {
                        "value": 13.0,
                        "unit": "g/dL",
                        "system": "http://unitsofmeasure.org",
                        "code": "g/dL"
                    },
                    "high": {
                        "value": 17.0,
                        "unit": "g/dL",
                        "system": "http://unitsofmeasure.org",
                        "code": "g/dL"
                    }
                }
            ]
        },
        {
            "resourceType": "Observation",
            "id": "inner-observation-labresult-4",
            "meta": {
                "profile": [
                    "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_LabResult"
                ]
            },
            "status": "final",
            "category": [
                {
                    "coding": [
                        {
                            "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_SimpleObservationCategory_CS",
                            "code": "laboratory"
                        }
                    ]
                }
            ],
            "code": {
                "coding": [
                    {
                        "system": "https://fhir.loinc.org",
                        "code": "20570-8",
                        "display": "Hematocrit [Volume Fraction] of Blood"
                    }
                ],
                "text": "ヘマトクリット"
            },
            "subject": {
                "reference": "Patient/jp-patient-example-1"
            },
            "effectiveDateTime": "2024-06-06T08:30:00+09:00",
            "performer": [
                {
                    "reference": "Organization/jp-organization-example-hospital",
                    "display": "Nagara hospital"
                }
            ],
            "valueQuantity": {
                "value": 40.1,
                "unit": "%"
            },
            "specimen": {
                "reference": "Specimen/jp-specimen-example-2"
            },
            "referenceRange": [
                {
                    "low": {
                        "value": 38.5,
                        "unit": "%"
                    },
                    "high": {
                        "value": 51.8,
                        "unit": "%"
                    }
                }
            ]
        },
        {
          "resourceType": "Observation",
          "id": "inner-observation-labresult-4",
          "meta": {
            "profile": [
              "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_LabResult"
            ]
          },
          "status": "final",
          "category": [
            {
              "coding": [
                {
                  "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_SimpleObservationCategory_CS",
                  "code": "laboratory"
                }
              ]
            }
          ],
          "code": {
            "coding": [
              {
                "system": "https://fhir.loinc.org",
                "code": "26515-7",
                "display": "Platelets [#/volume] in Blood"
              }
            ],
            "text": "血小板数"
          },
          "subject": {
            "reference": "Patient/jp-patient-example-1"
          },
          "effectiveDateTime": "2024-06-06T08:30:00+09:00",
            "performer": [
                {
                    "reference": "Organization/jp-organization-example-hospital",
                    "display": "Nagara hospital"
                }
            ],
            "valueQuantity": {
                "value": 309,
                "unit": "10*3/uL"
            },
            "specimen": {
                "reference": "Specimen/jp-specimen-example-2"
            },
            "referenceRange": [
                {
                  "low": {
                    "value": 120,
                    "unit": "10*3/uL"
                  },
                  "high": {
                    "value": 450,
                    "unit": "10*3/uL"
                  }
                }
            ]
        }
    ],
    "identifier": [
        {
            "system": "http://nagara-hospital.local/fhir/lab/reportid",
            "value": "123456"
        }
    ],
    "status": "final",
    "category": [
        {
            "coding": [
                {
                    "system": "http://loinc.org",
                    "code": "55429-5",
                    "display": "血算"
                }
            ]
        }
    ],
    "code": {
        "coding": [
            {
                "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_DocumentCodes_CS",
                "code": "11502-2",
                "display": "検体検査報告書"
            }
        ]
    },
    "subject": {
        "reference": "Patient/jp-patient-example-1"
    },
    "encounter": {
        "reference": "Encounter/jp-encounter-example-1"
    },
    "effectiveDateTime": "2024-08-25T08:30:00+09:00",
    "issued": "2024-06-06T08:30:00+09:00",
    "performer": [
        {
            "reference": "Organization/jp-organization-example-hospital",
            "display": "nagara hospital"
        }
    ],
    "result": [
      {
        "reference": "#inner-observation-labresult-1"
      },
      {
        "reference": "#inner-observation-labresult-2"
      },
      {
        "reference": "#inner-observation-labresult-3"
      },
      {
        "reference": "#inner-observation-labresult-4"
      },
      {
        "reference": "#inner-observation-labresult-5"
      }
    ]
}
JSON

FLAT_JSON = <<~JSON
{
    "laboratorytestreport/category|value": "event",
    "laboratorytestreport/category|terminology": "openehr",
    "laboratorytestreport/category|code": "433",
    "laboratorytestreport/context/report_id": "0002228",
    "laboratorytestreport/context/start_time": "2024-06-06T08:30:00+09:00",
    "laboratorytestreport/context/setting|value": "home",
    "laboratorytestreport/context/setting|code": "225",
    "laboratorytestreport/context/setting|terminology": "openehr",
    "laboratorytestreport/context/_end_time": "2024-06-06T08:30:00+09:00",
    "laboratorytestreport/context/_health_care_facility|name": "Nagara hospital",
    "laboratorytestreport/laboratory_test_result/any_event:0/test_name": "血算",
    "laboratorytestreport/laboratory_test_result/any_event:0/test_name/_mapping/target|terminology": "http://loinc.org",
    "laboratorytestreport/laboratory_test_result/any_event:0/test_name/_mapping/target|code": "55429-5",
    "laboratorytestreport/laboratory_test_result/any_event:0/test_name/_mapping|match": "=",
    "laboratorytestreport/laboratory_test_result/any_event:0/overall_test_status:0|code": "at0038",
    "laboratorytestreport/laboratory_test_result/any_event:0/overall_test_status:0|terminology": "local",
    "laboratorytestreport/laboratory_test_result/any_event:0/overall_test_status:0|value": "Final",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/analyte_result_sequence": 1,
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/analyte_name": "白血球数",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/analyte_name/_mapping/target|terminology": "http://loinc.org",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/analyte_name/_mapping/target|code": "26464-8",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/analyte_name/_mapping|match": "=",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/analyte_result:0/quantity_value|magnitude": 6.8,
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/analyte_result:0/quantity_value|unit": "10*3/ul",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/reference_range_guidance": "3.2<9.8",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/result_status:0|value": "Final",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/result_status:0|code": "at0018",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/result_status:0|terminology": "local",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/result_status_time": "2024-06-06T08:30:00+09:00",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/specimen/identifier_value|id": "Specimen/jp-specimen-example-2",
    "laboratorytestreport/laboratory_test_result/any_event:0/time": "2024-06-06T08:30:00+09:00",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:1/analyte_result_sequence": 2,
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:1/analyte_name": "赤血球数",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:1/analyte_name/_mapping/target|terminology": "http://loinc.org",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:1/analyte_name/_mapping/target|code": "26453-1",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:1/analyte_name/_mapping|match": "=",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:1/analyte_result:0/quantity_value|magnitude": 4.05,
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:1/analyte_result:0/quantity_value|unit": "10*6/uL",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:1/reference_range_guidance": "4.0<5.7",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:1/result_status:0|terminology": "local",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:1/result_status:0|code": "at0018",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:1/result_status:0|value": "Final",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:1/specimen/identifier_value|id": "Specimen/jp-specimen-example-2",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:2/analyte_result_sequence": 3,
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:2/analyte_name/_mapping/target|terminology": "http://loinc.org",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:2/analyte_name/_mapping/target|code": "718-7",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:2/analyte_name/_mapping|match": "=",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:2/analyte_name": "血色素量",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:2/analyte_result:0/quantity_value|magnitude": 13.0,
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:2/analyte_result:0/quantity_value|unit": "g/dL",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:2/reference_range_guidance": "13<17",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:2/result_status:0|terminology": "local",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:2/result_status:0|value": "Final",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:2/result_status:0|code": "at0018",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:2/specimen/identifier_value|id": "Specimen/jp-specimen-example-2",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:3/analyte_result_sequence": 4,
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:3/analyte_name": "ヘマトクリット",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:3/analyte_name/_mapping/target|terminology": "http://loinc.org",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:3/analyte_name/_mapping/target|code": "20570-8",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:3/analyte_name/_mapping|match": "=",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:3/analyte_result:0/quantity_value|magnitude": 40.1,
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:3/analyte_result:0/quantity_value|unit": "%",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:3/reference_range_guidance": "31.5<51.8",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:3/result_status:0|terminology": "local",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:3/result_status:0|value": "Final",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:3/result_status:0|code": "at0018",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:3/specimen/identifier_value|id": "Specimen/jp-specimen-example-2",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:4/analyte_result_sequence": 4,
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:4/analyte_name": "血小板数",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:4/analyte_name/_mapping/target|terminology": "http://loinc.org",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:4/analyte_name/_mapping/target|code": "26515-7",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:4/analyte_name/_mapping|match": "=",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:4/analyte_result:0/quantity_value|magnitude": 309,
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:4/analyte_result:0/quantity_value|unit": "10*3/uL",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:4/reference_range_guidance": "120<450",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:4/result_status:0|terminology": "local",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:4/result_status:0|value": "Final",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:4/result_status:0|code": "at0018",
    "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:4/specimen/identifier_value|id": "Specimen/jp-specimen-example-2",
    "laboratorytestreport/laboratory_test_result/language|code": "ja",
    "laboratorytestreport/laboratory_test_result/language|terminology": "ISO_639-1",
    "laboratorytestreport/laboratory_test_result/encoding|terminology": "IANA_character-sets",
    "laboratorytestreport/laboratory_test_result/encoding|code": "UTF-8",
    "laboratorytestreport/language|terminology": "ISO_639-1",
    "laboratorytestreport/language|code": "en",
    "laboratorytestreport/territory|code": "JP",
    "laboratorytestreport/territory|terminology": "ISO_3166-1",
    "laboratorytestreport/composer|name": "Shinji KOBAYASHI"
}
JSON


MML = <<XML
<?xml version="1.0" encoding="UTF-8"?>
<mmlLb:TestModule
    xmlns:mmlLb="http://www.medxml.net/MML/v4/ContentModule/test/1.0"
    xmlns:mmlCm="http://www.medxml.net/MML/v4/SharedComponent/Common/1.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.medxml.net/MML/v4/ContentModule/test/1.0/testhistory.xsd">
    <mmlLb:information mmlLb:registId="0002228" mmlLb:registTime="2024-06-06T08:30:00+09:00" mmlLb:reportTime="2024-06-06T08:30:00+09:00">
      <mmlLb:set mmlLb:setCode="55429-5" mmlLb:setCodeId="LOINC">血算</mmlLb:set>
      <mmlLb:reportStatus mmlLb:statusCode="final" mmlLb:statusCodeId="mmlLB0001">最終報告</mmlLb:reportStatus>
      <mmlLb:facility mmlLb:facilityCode="JPN432101234567" mmlLb:facilityCodeId="JMARI">Nagara Hospital</mmlLb:facility>
      <mmlLb:client mmlLb:clientCode="facility" mmlLb:clientCodeId="JPN432101234567">87654321</mmlLb:client>
      <mmlLb:laboratoryCenter mmlLb:centerCode="JPN432101234567" mmlLb:centerCodeId="JMARI">Nagara hospital</mmlLb:laboratoryCenter>
    </mmlLb:information>
    <mmlLb:laboTest>
      <mmlLb:specimen>
        <mmlLb:specimenName>Specimen/jp-specimen-example-2</mmlLb:specimenName>
      </mmlLb:specimen>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="26464-8" mmlLb:itCodeId="LOINC">白血球数</mmlLb:itemName>
        <mmlLb:value>6.8 10*3/uL/mmlLb:value>
        <mmlLb:numValue mmlLb:up="9.8" mmlLb:low="3.2">6.8</mmlLb:numValue>
        <mmlLb:unit>10*3/uL</mmlLb:unit>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="26453-1" mmlLb:itCodeId="LOINC">赤血球数</mmlLb:itemName>
        <mmlLb:value>4.05 10*6/uL</mmlLb:value>
        <mmlLb:numValue mmlLb:up="5.7" mmlLb:low="4.0">4.05</mmlLb:numValue>
        <mmlLb:unit>10*6/uL</mmlLb:unit>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="291" mmlLb:itCodeId="LOINC">血色素量</mmlLb:itemName>
        <mmlLb:value>13.0 g/dL</mmlLb:value>
        <mmlLb:numValue mmlLb:up="17" mmlLb:low="13.0">13.0</mmlLb:numValue>
        <mmlLb:unit>g/dL</mmlLb:unit>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="20570-8" mmlLb:itCodeId="LOINC">ヘマトクリット</mmlLb:itemName>
        <mmlLb:value>40.1 %</mmlLb:value>
        <mmlLb:numValue mmlLb:up="51.8" mmlLb:low="38.5">140.1</mmlLb:numValue>
        <mmlLb:unit>%</mmlLb:unit>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="26515-7" mmlLb:itCodeId="LOINC">血小板数</mmlLb:itemName>
        <mmlLb:value>309 10*3/uL</mmlLb:value>
        <mmlLb:numValue mmlLb:up="450" mmlLb:low="120">309</mmlLb:numValue>
        <mmlLb:unit>10*3/uL</mmlLb:unit>
      </mmlLb:item>
    </mmlLb:laboTest>
</mmlLb:TestModule>
XML
