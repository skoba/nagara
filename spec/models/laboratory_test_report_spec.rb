RSpec.describe LaboratoryTestReport do
  let(:laboratory_test_report) { build :laboratory_test_report }

  describe 'Sample instance generation' do
    it 'generates a valid instance from factory_bot' do
      expect(laboratory_test_report).to be_valid
    end
  end

  describe 'parser' do
    it 'parse HL7 FHIR json' do
      expect(LaboratoryTestReport.from_fhir_json(FHIR_JSON).test_name).to eq '検体検査報告書'
    end

    it 'parse FLAT JSON of openEHR' do
      expect(LaboratoryTestReport.from_flat_json(FLAT_JSON).test_name).to eq '検体検査報告書'
    end

    it 'parse MML' do
      expect(LaboratoryTestReport.from_mml(MML).test_name).to eq '検体検査報告書'
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
      "display": "Nagara hospital"
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
    "laboratorytestreport/laboratory_test_result/any_event:0/test_name": "検体検査報告書",
    "laboratorytestreport/laboratory_test_result/any_event:0/test_name/_mapping/target|terminology": "http://jpfhir.jp/fhir/core/CodeSystem/JP_DocumentCodes_CS",
    "laboratorytestreport/laboratory_test_result/any_event:0/test_name/_mapping/target|code": "11502-2",
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
<Mml version="4.2.0"
     createDate="2016-12-04T19:41:11"
     xmlns:xhtml="http://www.w3.org/1999/xhtml"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
     xmlns="http://www.medxml.net/MML/v4/base/1.0"
     xmlns:mml="http://www.medxml.net/MML/v4/base/1.0"
     xmlns:mmlCm="http://www.medxml.net/MML/v4/SharedComponent/Common/1.0"
     xmlns:mmlNm="http://www.medxml.net/MML/v4/SharedComponent/Name/1.0"
     xmlns:mmlFc="http://www.medxml.net/MML/v4/SharedComponent/Facility/1.0"
     xmlns:mmlDp="http://www.medxml.net/MML/v4/SharedComponent/Department/1.0"
     xmlns:mmlAd="http://www.medxml.net/MML/v4/SharedComponent/Address/1.0"
     xmlns:mmlPh="http://www.medxml.net/MML/v4/SharedComponent/Phone/1.0"
     xmlns:mmlPsi="http://www.medxml.net/MML/v4/SharedComponent/PersonalizedInfo/1.0"
     xmlns:mmlCi="http://www.medxml.net/MML/v4/SharedComponent/CreatorInfo/1.0"
     xmlns:mmlPi="http://www.medxml.net/MML/v4/ContentModule/PatientInfo/1.0"
     xmlns:mmlBc="http://www.medxml.net/MML/v4/ContentModule/BaseClinic/1.0"
     xmlns:mmlFcl="http://www.medxml.net/MML/v4/ContentModule/FirstClinic/1.0"
     xmlns:mmlHi="http://www.medxml.net/MML/v4/SharedComponent/HealthInsurance/1.0"
     xmlns:mmlLs="http://www.medxml.net/MML/v4/ContentModule/Lifestyle/1.0"
     xmlns:mmlPc="http://www.medxml.net/MML/v4/ContentModule/ProgressCourse/1.0"
     xmlns:mmlRd="http://www.medxml.net/MML/v4/SharedComponent/RegisteredDiagnosis/1.0"
     xmlns:mmlSg="http://www.medxml.net/MML/v4/ContentModule/Surgery/1.0"
     xmlns:mmlSm="http://www.medxml.net/MML/v4/ContentModule/Summary/1.0"
     xmlns:mmlLb="http://www.medxml.net/MML/v4/ContentModule/test/1.0"
     xmlns:mmlRp="http://www.medxml.net/MML/v4/ContentModule/report/1.0"
     xmlns:mmlRe="http://www.medxml.net/MML/v4/ContentModule/Referral/1.0"
     xmlns:mmlSc="http://www.medxml.net/MML/v4/SharedComponent/Security/1.0"
     xmlns:claim="http://www.medxml.net/claim/claimModule/2.1"
     xmlns:claimA="http://www.medxml.net/claim/claimAmountModule/2.1">
  <MmlHeader>
    <mmlCi:CreatorInfo>
      <mmlPsi:PersonalizedInfo>
	      <mmlCm:Id mmlCm:type="facility" mmlCm:tableId="JPN999999900009">11</mmlCm:Id>
	      <mmlPsi:personName>
	        <mmlNm:Name mmlNm:repCode="I" mmlNm:tableId="MML0025">
	          <mmlNm:family>責任者姓</mmlNm:family>
	          <mmlNm:given>責任者名</mmlNm:given>
	        </mmlNm:Name>
	      </mmlPsi:personName>
	      <mmlFc:Facility>
	        <mmlFc:name mmlFc:repCode="I" mmlFc:tableId="MML0025">Nagara Hospital</mmlFc:name>
	        <mmlCm:Id mmlCm:type="JMARI" mmlCm:tableId="MML0027">JPN999999900009</mmlCm:Id>
	      </mmlFc:Facility>
      </mmlPsi:PersonalizedInfo>
      <mmlCi:creatorLicense mmlCi:tableId="MML0026">lab</mmlCi:creatorLicense>
    </mmlCi:CreatorInfo>
    <masterId>
      <mmlCm:Id mmlCm:type="facility" mmlCm:tableId="JPN999999900099">11370</mmlCm:Id>
    </masterId>
  </MmlHeader>
  <MmlBody>
    <MmlModuleItem>
      <docInfo contentModuleType="test">
      	<mmlSc:securityLevel>
	        <mmlSc:accessRight permit="read">
	          <mmlSc:facility>
	            <mmlSc:facilityName mmlSc:facilityCode="individual" mmlSc:tableId="MML0035" mmlSc:facilityId="JPN99999900099" mmlSc:facilityIdType="JMARI">Nagara Hospital</mmlSc:facilityName>
	          </mmlSc:facility>
	        </mmlSc:accessRight>
	        <mmlSc:accessRight permit="read">
	          <mmlSc:person>
	            <mmlSc:personName mmlSc:personCode="patient" mmlSc:tableId="MML0036">患者氏名</mmlSc:personName>
	          </mmlSc:person>
	        </mmlSc:accessRight>
	      </mmlSc:securityLevel>
      	<title generationPurpose="reportTest">検体検査報告書</title>
	      <docId>
	        <uid>b9b5008e-a3fe-4657-8c50-7c9964b6e60d</uid>
	      </docId>
    	  <confirmDate>2016-12-04T18:29:33</confirmDate>
	      <mmlCi:CreatorInfo>
	        <mmlPsi:PersonalizedInfo>
	          <mmlCm:Id mmlCm:type="facility" mmlCm:tableId="JPN999999900009">11</mmlCm:Id>
	          <mmlPsi:personName>
	            <mmlNm:Name mmlNm:repCode="I" mmlNm:tableId="MML0025">
		            <mmlNm:family>責任者姓</mmlNm:family>
		            <mmlNm:given>責任者名</mmlNm:given>
	            </mmlNm:Name>
	          </mmlPsi:personName>
	          <mmlFc:Facility>
	            <mmlFc:name mmlFc:repCode="I" mmlFc:tableId="MML0025">検査センター</mmlFc:name>
	            <mmlCm:Id mmlCm:type="JMARI" mmlCm:tableId="MML0027">JPN999999900009</mmlCm:Id>
	          </mmlFc:Facility>
	        </mmlPsi:PersonalizedInfo>
	        <mmlCi:creatorLicense mmlCi:tableId="MML0026">lab</mmlCi:creatorLicense>
	      </mmlCi:CreatorInfo>
	      <extRefs />
      </docInfo>
      <content>
        <mmlLb:TestModule>
          <mmlLb:information mmlLb:registId="0002228" mmlLb:registTime="2024-06-06T08:30:00+09:00" mmlLb:reportTime="2024-06-06T08:30:00+09:00">
            <mmlLb:set>血算</mmlLb:set>
              <mmlLb:reportStatus mmlLb:statusCode="final" mmlLb:statusCodeId="mmlLB0001">最終報告</mmlLb:reportStatus>
            <mmlLb:facility>Nagara Hospital</mmlLb:facility>
          </mmlLb:information>
          <mmlLb:laboTest>
            <mmlLb:specimen>
              <mmlLb:specimenName>Specimen/jp-specimen-example-2</mmlLb:specimenName>
            </mmlLb:specimen>
            <mmlLb:item>
              <mmlLb:itemName mmlLb:itCode="26464-8" mmlLb:itCodeId="LOINC">白血球数</mmlLb:itemName>
              <mmlLb:value>6.8 10*3/uL</mmlLb:value>
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
      </content>
    </MmlModuleItem>
  </MmlBody>
</Mml>
XML
