RSpec.describe LaboratoryTestReport do
  let(:laboratory_test_report) { build :laboratory_test_report }
  let(:fhir_json) { FHIR_JSON }

  describe 'Sample instance generation' do
    it 'generates a valid instance from factory_bot' do
      expect(laboratory_test_report).to be_valid
    end

    xit 'generete from FHIR JSON' do
      laboratory_test_report_from_fhir = d
      expect(fhir_json).to eq 
    end
  end

end
FHIR_JSON = <<~JSON
{
  "resourceType" : "Observation",
  "id" : "jp-observation-labresult-example-1",
  "meta" : {
    "profile" : ["http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_LabResult"]
  },

  "text" : {
    "status" : "generated",
    "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative: Observation</b><a name=\"jp-observation-labresult-example-1\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Observation &quot;jp-observation-labresult-example-1&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-jp-observation-labresult.html\">JP Core Observation LabResult Profile</a></p></div><p><b>basedOn</b>: <a name=\"jp-servicerequest-example-1\"> </a></p><blockquote><p/><p><a name=\"jp-servicerequest-example-1\"> </a></p><p><b>status</b>: active</p><p><b>intent</b>: original-order</p><p><b>code</b>: 生化学検査 <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (localcode#12345678)</span></p><p><b>subject</b>: <a href=\"Patient-jp-patient-example-1.html\">Patient/jp-patient-example-1</a> &quot; 山田&quot;</p><p><b>encounter</b>: <a href=\"Encounter-jp-encounter-example-1.html\">Encounter/jp-encounter-example-1</a></p><p><b>occurrence</b>: 2021-10-19 01:15:00+0900</p><p><b>requester</b>: <a href=\"Practitioner-jp-practitioner-example-female-1.html\">Practitioner/jp-practitioner-example-female-1</a> &quot; 東京&quot;</p><p><b>performer</b>: <a href=\"Practitioner-jp-practitioner-example-male-2.html\">Practitioner/jp-practitioner-example-male-2</a> &quot; 愛知&quot;</p></blockquote><p><b>status</b>: final</p><p><b>category</b>: Laboratory <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"CodeSystem-jp-simpleobservationcategory-cs.html\">JP Core Simple Observation Category CodeSystem</a>#laboratory)</span></p><p><b>code</b>: 尿酸 <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (localcode#05104; <a href=\"https://simplifier.net/resolve?scope=jpfhir-terminology@1.1.1&amp;canonical=urn:oid:1.2.392.200119.4.504\">JP Core Observation LabResult Code CodeSystem</a>#3C020000002327101)</span></p><p><b>subject</b>: <a href=\"Patient-jp-patient-example-1.html\">Patient/jp-patient-example-1</a> &quot; 山田&quot;</p><p><b>effective</b>: 2021-10-19 02:20:00+0900</p><p><b>performer</b>: <a href=\"Practitioner-jp-practitioner-example-female-1.html\">Practitioner/jp-practitioner-example-female-1</a> &quot; 東京&quot;</p><p><b>value</b>: 8.5 mg/dL</p><p><b>interpretation</b>: H <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/5.3.0/CodeSystem-v3-ObservationInterpretation.html\">ObservationInterpretation</a>#H &quot;High&quot;)</span></p><p><b>specimen</b>: <a href=\"Specimen-jp-specimen-example-1.html\">Specimen/jp-specimen-example-1</a></p><h3>ReferenceRanges</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Low</b></td><td><b>High</b></td><td><b>Type</b></td></tr><tr><td style=\"display: none\">*</td><td>2.1</td><td>7</td><td>Normal Range <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/5.3.0/CodeSystem-referencerange-meaning.html\">Observation Reference Range Meaning Codes</a>#normal)</span></td></tr></table><hr/><blockquote><p><b>Generated Narrative: ServiceRequest #jp-servicerequest-example-1</b><a name=\"jp-servicerequest-example-1\"> </a></p><p><b>status</b>: active</p><p><b>intent</b>: original-order</p><p><b>code</b>: 生化学検査 <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (localcode#12345678)</span></p><p><b>subject</b>: <a href=\"Patient-jp-patient-example-1.html\">Patient/jp-patient-example-1</a> &quot; 山田&quot;</p><p><b>encounter</b>: <a href=\"Encounter-jp-encounter-example-1.html\">Encounter/jp-encounter-example-1</a></p><p><b>occurrence</b>: 2021-10-19 01:15:00+0900</p><p><b>requester</b>: <a href=\"Practitioner-jp-practitioner-example-female-1.html\">Practitioner/jp-practitioner-example-female-1</a> &quot; 東京&quot;</p><p><b>performer</b>: <a href=\"Practitioner-jp-practitioner-example-male-2.html\">Practitioner/jp-practitioner-example-male-2</a> &quot; 愛知&quot;</p></blockquote></div>"
  },

  "contained" : [{
    "resourceType" : "ServiceRequest",
    "id" : "jp-servicerequest-example-1",
    "status" : "active",
    "intent" : "original-order",
    "code" : {
      "coding" : [{
        "system" : "http://abc-hospital.local/fhir/ObservationOrder/localcode",
        "code" : "12345678"
      }],
      "text" : "生化学検査"
    },
    "subject" : {
      "reference" : "Patient/jp-patient-example-1"
    },
    "encounter" : {
      "reference" : "Encounter/jp-encounter-example-1"
    },
    "occurrenceDateTime" : "2021-10-19T01:15:00+09:00",
    "requester" : {
      "reference" : "Practitioner/jp-practitioner-example-female-1"
    },
    "performer" : [{
      "reference" : "Practitioner/jp-practitioner-example-male-2"
    }]
  }],
  "basedOn" : [{
    "reference" : "#jp-servicerequest-example-1"
  }],
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://jpfhir.jp/fhir/core/CodeSystem/JP_SimpleObservationCategory_CS",
      "code" : "laboratory"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://abc-hospital.local/fhir/Observation/localcode",
      "code" : "05104",
      "display" : "尿酸"
    },
    {
      "system" : "urn:oid:1.2.392.200119.4.504",
      "code" : "3C020000002327101"
    }],
    "text" : "尿酸"
  },
  "subject" : {
    "reference" : "Patient/jp-patient-example-1"
  },
  "effectiveDateTime" : "2021-10-19T02:20:00+09:00",
  "performer" : [{
    "reference" : "Practitioner/jp-practitioner-example-female-1"
  }],
  "valueQuantity" : {
    "value" : 8.5,
    "unit" : "mg/dL"
  },
  "interpretation" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
      "code" : "H",
      "display" : "High"
    }],
    "text" : "H"
  }],

  "specimen" : {
    "reference" : "Specimen/jp-specimen-example-1"
  },
  "referenceRange" : [{
    "low" : {
      "value" : 2.1
    },
    "high" : {
      "value" : 7
    },
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/referencerange-meaning",
        "code" : "normal",
        "display" : "Normal Range"
      }]
    }
  }]
}
JSON

FLAT_JSON = <<JSON
{
  "laboratorytestreport/category|value": "event",
  "laboratorytestreport/category|terminology": "openehr",
  "laboratorytestreport/category|code": "433",
  "laboratorytestreport/context/report_id": "0002228",
  "laboratorytestreport/context/start_time": "2002-07-25T00:00:00",
  "laboratorytestreport/context/setting|value": "home",
  "laboratorytestreport/context/setting|code": "225",
  "laboratorytestreport/context/setting|terminology": "openehr",
  "laboratorytestreport/context/_end_time": "2002-07-25T00:00:00",
  "laboratorytestreport/context/_health_care_facility|name": "DOE, John",
  "laboratorytestreport/laboratory_test_result/any_event:0/test_name": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:0/overall_test_status:0|code": "at0107",
  "laboratorytestreport/laboratory_test_result/any_event:0/overall_test_status:0|terminology": "local",
  "laboratorytestreport/laboratory_test_result/any_event:0/overall_test_status:0|value": "Registered",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/analyte_result_sequence": 42,
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/analyte_name": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/analyte_result:0/text_value": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/reference_range_guidance": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/result_status:0|value": "Registered",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/result_status:0|code": "at0015",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/result_status:0|terminology": "local",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/specimen/identifier_value|id": "dev/null",
  "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result/comment:0": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:0/time": "2002-07-25T00:00:00",
  "laboratorytestreport/laboratory_test_result/any_event:0/width": "PT42H",
  "laboratorytestreport/laboratory_test_result/any_event:0/math_function|value": "minimum",
  "laboratorytestreport/laboratory_test_result/any_event:0/math_function|terminology": "openehr",
  "laboratorytestreport/laboratory_test_result/any_event:0/math_function|code": "145",
  "laboratorytestreport/laboratory_test_result/any_event:1/test_name": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:1/overall_test_status:0|code": "at0107",
  "laboratorytestreport/laboratory_test_result/any_event:1/overall_test_status:0|value": "Registered",
  "laboratorytestreport/laboratory_test_result/any_event:1/overall_test_status:0|terminology": "local",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/analyte_result_sequence": 42,
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/analyte_name": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/analyte_result:0/text_value": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/reference_range_guidance": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/result_status:0|terminology": "local",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/result_status:0|code": "at0015",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/result_status:0|value": "Registered",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/specimen/identifier_value|id": "dev/null",
  "laboratorytestreport/laboratory_test_result/any_event:1/laboratory_analyte_result/comment:0": "Lorem ipsum",
  "laboratorytestreport/laboratory_test_result/any_event:1/time": "2022-02-03T04:05:06",
  "laboratorytestreport/laboratory_test_result/any_event:2/test_name": "Lorem ipsum",
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
