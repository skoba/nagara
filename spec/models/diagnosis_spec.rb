RSpec.describe Diagnosis do
  let(:diagnosis) { build :diagnosis }
  let(:flat_json) { FLAT_JSON }
  let(:fhir_json) { FHIR_JSON }

  describe "build a valid instance" do
    it "is valid" do
      expect(diagnosis).to be_valid
    end
  end

  describe "registration to EHRbase" do
    it 'create FLAT JSON format that equals to flat_json sample' do
      expect(JSON.parse(diagnosis.flat_json)).to eq JSON.parse(flat_json)
    end
    
    it 'saves successfully' do
      expect(diagnosis.save).to be_truthy
    end
  end

  describe "to parse from FHIR" do
    let(:diagnosis_from_fhir) { Diagnosis.parse_from_fhir(fhir_json)}

    it 'parse FHIR json' do
      expect(diagnosis_from_fhir).to be_truthy
    end

    it 'onset is 2002-01-25' do
      expect(diagnosis_from_fhir.onset).to eq '2002-01-25'
    end

    it 'certainty is Confirmed' do
      expect(diagnosis_from_fhir.diagnostic_certainty).to eq 'Confirmed'
    end
  end

  describe 'generate FHIR JSON' do
    it 'generate FHIR condition resource equals to FHIR_JSON' do
      expect(JSON.parse(diagnosis.to_fhir)).to eq JSON.parse(FHIR_JSON)
    end
  end

  describe "to parse from MML" do
    let(:diagnosis_from_mml) { Diagnosis.parse_from_mml(MML) }
    
    it 'parse MML' do
      expect(diagnosis_from_mml).to be_truthy
    end

    it 's certainty is Confirmed' do
      expect(diagnosis_from_mml.diagnostic_certainty).to eq 'Confirmed'
    end
  end

  describe 'generate MML' do
    it 's XML is equals MML instance' do
      expect(diagnosis.to_mml).to eq MML
    end
  end
end

FLAT_JSON = <<JSON
{
  "problemlist/category|code": "433",
  "problemlist/category|terminology": "openehr",
  "problemlist/category|value": "event",
  "problemlist/problem_diagnosis/problem_diagnosis_name|terminology": "ICD-10",
  "problemlist/problem_diagnosis/problem_diagnosis_name|code": "E790-.003",
  "problemlist/problem_diagnosis/problem_diagnosis_name|value": "高尿酸血症",
  "problemlist/problem_diagnosis/date_time_of_onset": "2002-01-25",
  "problemlist/problem_diagnosis/date_time_clinically_recognised": "2002-01-25",
  "problemlist/problem_diagnosis/diagnostic_certainty|terminology": "local",
  "problemlist/problem_diagnosis/diagnostic_certainty|value": "Confirmed",
  "problemlist/problem_diagnosis/diagnostic_certainty|code": "at0076",
  "problemlist/territory|terminology": "ISO_3166-1",
  "problemlist/territory|code": "JP",
  "problemlist/composer|name": "Shinji KOBAYASHI"
}
JSON

FHIR_JSON = <<JSON
{
  "resourceType": "Condition",
  "id": "jp-condition-example-1",
  "meta": {
    "profile": [
      "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Condition"
    ]
  },
  "verificationStatus": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/condition-ver-status",
        "code": "confirmed"
      }
    ]
  },
  "code": {
    "coding": [
      {
        "system": "urn:oid:2.16.840.1.113883.6.3",
        "code": "E790-.003"
      }
    ],
    "text": "高尿酸血症"
  },
  "subject": {
    "reference": "ehr_id:b3a123d3-86a9-46a9-a8b9-6ac9289abe97"
  },
  "onsetDateTime": {
    "value": "2002-01-25"
  },
  "recordedDate": {
    "value": "2002-01-25"
  }
}
JSON

MML = <<XML
<?xml version="1.0" encoding="UTF-8"?>
<mmlRd:RegisteredDiagnosisModule
  xmlns:mmlRd="http://www.medxml.net/MML/v4/ContentModule/RegisteredDiagnosis/1.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.medxml.net/MML/v4/ContentModule/RegisteredDiagnosis/1.0/registereddiagnosis.xsd">
  <mmlRd:diagnosis mmlRd:code="E790-.003" mmlRd:system="ICD-10">高尿酸血症</mmlRd:diagnosis>
  <mmlRd:categories>
    <mmlRd:category mmlRd:tableId="MML0015">confirmedDiagnosis</mmlRd:category>
  </mmlRd:categories>
  <mmlRd:startDate>2002-01-25</mmlRd:startDate>
  <mmlRd:firstEncounterDate>2002-01-25</mmlRd:firstEncounterDate>
</mmlRd:RegisteredDiagnosisModule>
XML