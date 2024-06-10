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
  "laboratorytestreport/context/_health_care_facility|name": "nagara hospital",
  "laboratorytestreport/laboratory_test_result/any_event:0/test_name": "検体検査報告書",
  "laboratorytestreport/laboratory_test_result/any_event:0/overall_test_status:0|code": "at0038",
  "laboratorytestreport/laboratory_test_result/any_event:0/overall_test_status:0|terminology": "local",
  "laboratorytestreport/laboratory_test_result/any_event:0/overall_test_status:0|value": "Final",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/analyte_result_sequence": 1,
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/analyte_name": "白血球数",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/analyte_result:0/magnitude": 6.8,
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/analyte_result:0/unit": "0*3/uL",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/reference_range_guidance": "13<17",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/result_status:0|value": "Final",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/result_status:0|code": "at0018",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/result_status:0|terminology": "local",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/specimen/identifier_value|id": "Specimen/jp-specimen-example-2",
  "laboratorytestreport/laboratory_test_result/any_event:0/time": "2024-06-06T08:30:00+09:0",
  "laboratorytestreport/laboratory_test_result/any_event:1/overall_test_status:0|code": "at0038",
  "laboratorytestreport/laboratory_test_result/any_event:1/overall_test_status:0|value": "Final",
  "laboratorytestreport/laboratory_test_result/any_event:1/overall_test_status:0|terminology": "local",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/analyte_result_sequence": 2,
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/analyte_name": "赤血球数",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/analyte_result:0/magunitude": 4.05,
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/analyte_result:0/unit": "10*6/uL",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/reference_range_guidance": "4.0<5.7",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/result_status:0|terminology": "local",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/result_status:0|code": "at0018",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/result_status:0|value": "Final",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/specimen/identifier_value|id": "Specimen/jp-specimen-example-2",
  "laboratorytestreport/laboratory_test_result/any_event:1/time": "2024-06-06T08:30:00+09:0",
  "laboratorytestreport/laboratory_test_result/any_event:2/test_name": "",
  "laboratorytestreport/laboratory_test_result/any_event:2/overall_test_status:0|code": "at0107",
  "laboratorytestreport/laboratory_test_result/any_event:2/overall_test_status:0|terminology": "local",
  "laboratorytestreport/laboratory_test_result/any_event:2/overall_test_status:0|value": "Registered",
  "laboratorytestreport/laboratory_test_result/any_event:2/laboratory_analyte_result/analyte_result_sequence": 42,
  "laboratorytestreport/laboratory_test_result/any_event:2/laboratory_analyte_result/analyte_name": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:2/laboratory_analyte_result/analyte_result:0/text_value": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:2/laboratory_analyte_result/reference_range_guidance": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:2/laboratory_analyte_result/result_status:0|terminology": "local",
  "laboratorytestreport/laboratory_test_result/any_event:2/laboratory_analyte_result/result_status:0|value": "Registered",
  "laboratorytestreport/laboratory_test_result/any_event:2/laboratory_analyte_result/result_status:0|code": "at0015",
  "laboratorytestreport/laboratory_test_result/any_event:2/laboratory_analyte_result/specimen/identifier_value|id": "dev/null",
  "laboratorytestreport/laboratory_test_result/any_event:2/laboratory_analyte_result/comment:0": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:2/time": "2022-02-03T04:05:06",
  "laboratorytestreport/laboratory_test_result/any_event:2/width": "PT42H",
  "laboratorytestreport/laboratory_test_result/any_event:2/math_function|terminology": "openehr",
  "laboratorytestreport/laboratory_test_result/any_event:2/math_function|code": "145",
  "laboratorytestreport/laboratory_test_result/any_event:2/math_function|value": "minimum",
  "laboratorytestreport/laboratory_test_result/language|code": "en",
  "laboratorytestreport/laboratory_test_result/language|terminology": "ISO_639-1",
  "laboratorytestreport/laboratory_test_result/encoding|terminology": "IANA_character-sets",
  "laboratorytestreport/laboratory_test_result/encoding|code": "UTF-8",
  "laboratorytestreport/laboratory_test_result/_work_flow_id|id": "28d43642-f3e4-3a63-a6d0-6fdda9d75465",
  "laboratorytestreport/laboratory_test_result/_work_flow_id|id_scheme": "scheme",
  "laboratorytestreport/laboratory_test_result/_work_flow_id|namespace": "unknown",
  "laboratorytestreport/laboratory_test_result/_work_flow_id|type": "ANY",
  "laboratorytestreport/laboratory_test_result/_guideline_id|id": "a8f48e4f-a3f4-39e6-a07e-1a7b4a099546",
  "laboratorytestreport/laboratory_test_result/_guideline_id|id_scheme": "scheme",
  "laboratorytestreport/laboratory_test_result/_guideline_id|namespace": "unknown",
  "laboratorytestreport/laboratory_test_result/_guideline_id|type": "ANY",
  "laboratorytestreport/language|terminology": "ISO_639-1",
  "laboratorytestreport/language|code": "en",
  "laboratorytestreport/territory|code": "DE",
  "laboratorytestreport/territory|terminology": "ISO_3166-1",
  "laboratorytestreport/composer|name": "Max Mustermann"
}
JSON


MML = <<XML
<?xml version="1.0" encoding="UTF-8"?>
<mmlLb:TestModule
    xmlns:mmlLb="http://www.medxml.net/MML/v4/ContentModule/test/1.0"
    xmlns:mmlCm="http://www.medxml.net/MML/v4/SharedComponent/Common/1.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.medxml.net/MML/v4/ContentModule/test/1.0/testhistory.xsd">
    <mmlLb:information mmlLb:registId="0002228" mmlLb:registTime="2002-07-25T00:00:00" mmlLb:reportTime="2002-07-25T11:15:00" mmlLb:sampleTime="2002-07-25T06:00:00">
      <mmlLb:reportStatus mmlLb:statusCode="final" mmlLb:statusCodeId="mmlLB0001">最終報告</mmlLb:reportStatus>
      <mmlLb:facility mmlLb:facilityCode="JPN432101234567" mmlLb:facilityCodeId="JMARI">テスト病院</mmlLb:facility>
      <mmlLb:department mmlLb:depCode="3" mmlLb:depCodeId="MML0028">第三内科</mmlLb:department>
      <mmlLb:client mmlLb:clientCode="facility" mmlLb:clientCodeId="JPN432101234567">87654321</mmlLb:client>
      <mmlLb:laboratoryCenter mmlLb:centerCode="JPN432101234567" mmlLb:centerCodeId="JMARI">テスト病院</mmlLb:laboratoryCenter>
    </mmlLb:information>
    <mmlLb:laboTest>
      <mmlLb:specimen>
        <mmlLb:specimenName mmlLb:spCode="00050" mmlLb:spCodeId="KRTZR">血液</mmlLb:specimenName>
      </mmlLb:specimen>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="292" mmlLb:itCodeId="KRTKC">BTR</mmlLb:itemName>
        <mmlLb:value>3.08</mmlLb:value>
        <mmlLb:numValue mmlLb:out="L">3.08</mmlLb:numValue>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="290" mmlLb:itCodeId="KRTKC">BCAA</mmlLb:itemName>
        <mmlLb:value>342</mmlLb:value>
        <mmlLb:numValue mmlLb:out="L">342</mmlLb:numValue>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="291" mmlLb:itCodeId="KRTKC">Tyr</mmlLb:itemName>
        <mmlLb:value>111</mmlLb:value>
        <mmlLb:numValue mmlLb:out="H">111</mmlLb:numValue>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="391" mmlLb:itCodeId="KRTKC">WBC</mmlLb:itemName>
        <mmlLb:value>5.9</mmlLb:value>
       <mmlLb:numValue mmlLb:out="N">5.9</mmlLb:numValue>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="390" mmlLb:itCodeId="KRTKC">RBC</mmlLb:itemName>
        <mmlLb:value>3.24</mmlLb:value>
        <mmlLb:numValue mmlLb:out="L">3.24</mmlLb:numValue>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="392" mmlLb:itCodeId="KRTKC">Hgb</mmlLb:itemName>
        <mmlLb:value>10.3</mmlLb:value>
        <mmlLb:numValue mmlLb:out="L">10.3</mmlLb:numValue>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="393" mmlLb:itCodeId="KRTKC">Hct</mmlLb:itemName>
        <mmlLb:value>30.0</mmlLb:value>
        <mmlLb:numValue mmlLb:out="L">30</mmlLb:numValue>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="394" mmlLb:itCodeId="KRTKC">MCV</mmlLb:itemName>
        <mmlLb:value>92.6</mmlLb:value>
        <mmlLb:numValue mmlLb:out="N">92.6</mmlLb:numValue>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="395" mmlLb:itCodeId="KRTKC">MCH</mmlLb:itemName>
        <mmlLb:value>31.8</mmlLb:value>
        <mmlLb:numValue mmlLb:out="N">31.8</mmlLb:numValue>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="396" mmlLb:itCodeId="KRTKC">MCHC</mmlLb:itemName>
        <mmlLb:value>34.3</mmlLb:value>
        <mmlLb:numValue mmlLb:out="N">34.3</mmlLb:numValue>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="397" mmlLb:itCodeId="KRTKC">RDW</mmlLb:itemName>
        <mmlLb:value>13.6</mmlLb:value>
        <mmlLb:numValue mmlLb:out="N">13.6</mmlLb:numValue>
      </mmlLb:item>
      <mmlLb:item>
        <mmlLb:itemName mmlLb:itCode="398" mmlLb:itCodeId="KRTKC">PLT</mmlLb:itemName>
        <mmlLb:value>142</mmlLb:value>
        <mmlLb:numValue mmlLb:out="N">142</mmlLb:numValue>
      </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="399" mmlLb:itCodeId="KRTKC">NEUT</mmlLb:itemName>
      <mmlLb:value>58.6</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">58.6</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="448" mmlLb:itCodeId="KRTKC">PT-1</mmlLb:itemName>
      <mmlLb:value>15.4</mmlLb:value>
      <mmlLb:numValue mmlLb:out="H">15.4</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="449" mmlLb:itCodeId="KRTKC">PT-2</mmlLb:itemName>
      <mmlLb:value>71</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">71</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="488" mmlLb:itCodeId="KRTKC">INR</mmlLb:itemName>
      <mmlLb:value>1.29</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">1.29</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="458" mmlLb:itCodeId="KRTKC">HPT</mmlLb:itemName>
      <mmlLb:value>56</mmlLb:value>
      <mmlLb:numValue mmlLb:out="L">56</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="450" mmlLb:itCodeId="KRTKC">APTT1</mmlLb:itemName>
      <mmlLb:value>33.5</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">33.5</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="451" mmlLb:itCodeId="KRTKC">APTT2</mmlLb:itemName>
      <mmlLb:value>94</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">94</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="425" mmlLb:itCodeId="KRTKC">MPV</mmlLb:itemName>
      <mmlLb:value>10.5</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">10.5</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="424" mmlLb:itCodeId="KRTKC">PCT</mmlLb:itemName>
      <mmlLb:value>0.149</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">0.149</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="426" mmlLb:itCodeId="KRTKC">PDW</mmlLb:itemName>
      <mmlLb:value>11.9</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">11.9</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="406" mmlLb:itCodeId="KRTKC">LYMP</mmlLb:itemName>
      <mmlLb:value>29.5</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">29.5</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="407" mmlLb:itCodeId="KRTKC">MONO</mmlLb:itemName>
      <mmlLb:value>8.2</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">8.2</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="408" mmlLb:itCodeId="KRTKC">EOS</mmlLb:itemName>
      <mmlLb:value>2.7</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">2.7</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="409" mmlLb:itCodeId="KRTKC">BASO</mmlLb:itemName>
      <mmlLb:value>1.0</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">1</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="530" mmlLb:itCodeId="KRTKC">Na</mmlLb:itemName>
      <mmlLb:value>143</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">143</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="531" mmlLb:itCodeId="KRTKC">K</mmlLb:itemName>
      <mmlLb:value>3.8</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">3.8</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="532" mmlLb:itCodeId="KRTKC">Cl</mmlLb:itemName>
      <mmlLb:value>110</mmlLb:value>
      <mmlLb:numValue mmlLb:out="H">110</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="523" mmlLb:itCodeId="KRTKC">TTT</mmlLb:itemName>
      <mmlLb:value>0.3</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">0.3</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="520" mmlLb:itCodeId="KRTKC">TP</mmlLb:itemName>
      <mmlLb:value>6.0</mmlLb:value>
      <mmlLb:numValue mmlLb:out="L">6</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="528" mmlLb:itCodeId="KRTKC">Alb</mmlLb:itemName>
      <mmlLb:value>3.3</mmlLb:value>
      <mmlLb:numValue mmlLb:out="L">3.3</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="525" mmlLb:itCodeId="KRTKC">BUN</mmlLb:itemName>
      <mmlLb:value>16.6</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">16.6</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="526" mmlLb:itCodeId="KRTKC">Crea</mmlLb:itemName>
      <mmlLb:value>0.80</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">0.8</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="533" mmlLb:itCodeId="KRTKC">Ca</mmlLb:itemName>
      <mmlLb:value>7.6</mmlLb:value>
      <mmlLb:numValue mmlLb:out="L">7.6</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="534" mmlLb:itCodeId="KRTKC">iP</mmlLb:itemName>
      <mmlLb:value>3.3</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">3.3</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="527" mmlLb:itCodeId="KRTKC">UA</mmlLb:itemName>
      <mmlLb:value>5.2</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">5.2</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="560" mmlLb:itCodeId="KRTKC">GOT</mmlLb:itemName>
      <mmlLb:value>38</mmlLb:value>
      <mmlLb:numValue mmlLb:out="H">38</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="561" mmlLb:itCodeId="KRTKC">GPT</mmlLb:itemName>
      <mmlLb:value>21</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">21</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="564" mmlLb:itCodeId="KRTKC">ALP</mmlLb:itemName>
      <mmlLb:value>147</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">147</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="563" mmlLb:itCodeId="KRTKC">LDH</mmlLb:itemName>
      <mmlLb:value>215</mmlLb:value>
      <mmlLb:numValue mmlLb:out="H">215</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="570" mmlLb:itCodeId="KRTKC">r-GTP</mmlLb:itemName>
      <mmlLb:value>27</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">27</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="540" mmlLb:itCodeId="KRTKC">T-Bil</mmlLb:itemName>
      <mmlLb:value>0.9</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">0.9</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="575" mmlLb:itCodeId="KRTKC">Amy</mmlLb:itemName>
      <mmlLb:value>101</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">101</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="543" mmlLb:itCodeId="KRTKC">D-Bil</mmlLb:itemName>
      <mmlLb:value>0.2</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">0.2</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="571" mmlLb:itCodeId="KRTKC">Ch-E</mmlLb:itemName>
      <mmlLb:value>62</mmlLb:value>
      <mmlLb:numValue mmlLb:out="L">62</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="566" mmlLb:itCodeId="KRTKC">LAP</mmlLb:itemName>
      <mmlLb:value>36</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">36</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="524" mmlLb:itCodeId="KRTKC">ZTT</mmlLb:itemName>
      <mmlLb:value>5.6</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">5.6</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="515" mmlLb:itCodeId="KRTKC">T-BA</mmlLb:itemName>
      <mmlLb:value>20.5</mmlLb:value>
      <mmlLb:numValue mmlLb:out="H">20.5</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="610" mmlLb:itCodeId="KRTKC">T-Cho</mmlLb:itemName>
      <mmlLb:value>112</mmlLb:value>
      <mmlLb:numValue mmlLb:out="L">112</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="614" mmlLb:itCodeId="KRTKC">TG</mmlLb:itemName>
      <mmlLb:value>81</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">81</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="600" mmlLb:itCodeId="KRTKC">Fe</mmlLb:itemName>
      <mmlLb:value>108</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">108</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="602" mmlLb:itCodeId="KRTKC">UIBC</mmlLb:itemName>
      <mmlLb:value>66</mmlLb:value>
      <mmlLb:numValue mmlLb:out="L">66</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="640" mmlLb:itCodeId="KRTKC">F-Alb</mmlLb:itemName>
      <mmlLb:value>61.1</mmlLb:value>
      <mmlLb:numValue mmlLb:out="L">61.1</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="641" mmlLb:itCodeId="KRTKC">F-a1</mmlLb:itemName>
      <mmlLb:value>3.3</mmlLb:value>
      <mmlLb:numValue mmlLb:out="H">3.3</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="642" mmlLb:itCodeId="KRTKC">F-a2</mmlLb:itemName>
      <mmlLb:value>6.7</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">6.7</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="643" mmlLb:itCodeId="KRTKC">F-B</mmlLb:itemName>
      <mmlLb:value>10.6</mmlLb:value>
      <mmlLb:numValue mmlLb:out="H">10.6</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="644" mmlLb:itCodeId="KRTKC">F-r</mmlLb:itemName>
      <mmlLb:value>18.3</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">18.3</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="639" mmlLb:itCodeId="KRTKC">A/Gヒ</mmlLb:itemName>
      <mmlLb:value>1.57</mmlLb:value>
      <mmlLb:numValue mmlLb:out="L">1.57</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="950" mmlLb:itCodeId="KRTKC">HCV</mmlLb:itemName>
      <mmlLb:value mmlLb:out="N">インセイ</mmlLb:value>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="954" mmlLb:itCodeId="KRTKC">HCVCI</mmlLb:itemName>
      <mmlLb:value>0.22</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">0.22</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="913" mmlLb:itCodeId="KRTKC">HBsAg</mmlLb:itemName>
      <mmlLb:value mmlLb:out="N">インセイ</mmlLb:value>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="914" mmlLb:itCodeId="KRTKC">sAgCI</mmlLb:itemName>
      <mmlLb:value>0.00</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">0</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="915" mmlLb:itCodeId="KRTKC">HBsAb</mmlLb:itemName>
      <mmlLb:value mmlLb:out="N">ヨウセイ</mmlLb:value>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="916" mmlLb:itCodeId="KRTKC">mIUml</mmlLb:itemName>
      <mmlLb:value>42.9</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">42.9</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="921" mmlLb:itCodeId="KRTKC">HBcAb</mmlLb:itemName>
      <mmlLb:value mmlLb:out="N">ヨウセイ</mmlLb:value>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="922" mmlLb:itCodeId="KRTKC">cAb%I</mmlLb:itemName>
      <mmlLb:value>68.03</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">68.03</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="923" mmlLb:itCodeId="KRTKC">cAb20</mmlLb:itemName>
      <mmlLb:value>0.00</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">0</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="931" mmlLb:itCodeId="KRTKC">IgG</mmlLb:itemName>
      <mmlLb:value>1030</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">1030</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="932" mmlLb:itCodeId="KRTKC">IgA</mmlLb:itemName>
      <mmlLb:value>667</mmlLb:value>
      <mmlLb:numValue mmlLb:out="H">667</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="933" mmlLb:itCodeId="KRTKC">IgM</mmlLb:itemName>
      <mmlLb:value>44</mmlLb:value>
      <mmlLb:numValue mmlLb:out="L">44</mmlLb:numValue>
    </mmlLb:item>
    <mmlLb:item>
      <mmlLb:itemName mmlLb:itCode="1021" mmlLb:itCodeId="KRTKC">PIVKA2</mmlLb:itemName>
      <mmlLb:value>11</mmlLb:value>
      <mmlLb:numValue mmlLb:out="N">11</mmlLb:numValue>
      </mmlLb:item>
    </mmlLb:laboTest>
</mmlLb:TestModule>
XML
