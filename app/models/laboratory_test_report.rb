# frozen_string_literal: true

require 'nokogiri'
require 'fhir_models'

class LaboratoryTestReport
  include ActiveModel::API
  attr_accessor :test_name, :analytes

  def save
    ehr_id = 'b6fa57bf-75cf-483f-8cc3-d9e136676a52'
    url = "http://localhost:8080/ehrbase/rest/openehr/v1/ehr/#{ehr_id}/composition"
    query = { format: 'FLAT', templateId: 'LaboratoryTestReport.v.1.4.0' }
    header = { 'Content-type' => 'application/json' }
    client = HTTPClient.new
    res = client.post(url, { query:, header:, body: to_flat_json })
    res.status
  end

  def to_flat_json
    <<~JSON
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
        "laboratorytestreport/laboratory_test_result/any_event:0/test_name": "#{test_name}",
        "laboratorytestreport/laboratory_test_result/any_event:0/test_name/_mapping/target|terminology": "http://jpfhir.jp/fhir/core/CodeSystem/JP_DocumentCodes_CS",
        "laboratorytestreport/laboratory_test_result/any_event:0/test_name/_mapping/target|code": "11502-2",
        "laboratorytestreport/laboratory_test_result/any_event:0/test_name/_mapping|match": "=",
        "laboratorytestreport/laboratory_test_result/any_event:0/overall_test_status:0|code": "at0038",
        "laboratorytestreport/laboratory_test_result/any_event:0/overall_test_status:0|terminology": "local",
        "laboratorytestreport/laboratory_test_result/any_event:0/overall_test_status:0|value": "Final",
        "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/analyte_result_sequence": 1,
        "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/analyte_name": "#{analytes[0].name}",
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
        "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:0/specimen|id": "Specimen/jp-specimen-example-2",
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
        "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:1/specimen|id": "Specimen/jp-specimen-example-2",
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
        "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:2/specimen|id": "Specimen/jp-specimen-example-2",
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
        "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:3/specimen|id": "Specimen/jp-specimen-example-2",
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
        "laboratorytestreport/laboratory_test_result/any_event:0/laboratory_analyte_result:4/specimen|id": "Specimen/jp-specimen-example-2",
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
  end

  class << self
    def all
      url = 'http://localhost:8080/ehrbase/rest/openehr/v1/query/aql'
      query = { q: "SELECT c FROM COMPOSITION c WHERE c/archetype_details/template_id/value='LaboratoryTestReport.v.1.4.0'" }
      response = HTTPClient.get(url, query)
      test_name = analytes = nil
      JSON.parse(response.body)['rows'].map do |laboratory_test_report|
        test_name = laboratory_test_report[0]['content'][0]['data']['events'][0]['data']['items'][0]['value']['value']
        items = laboratory_test_report[0]['content'][0]['data']['events'][0]['data']['items'].select do |item|
          item['name']['value'] == 'Laboratory analyte result'
        end
        analytes = items.map do |analyte|
          name = analyte['items'][1]['value']['value']
          value = analyte['items'][2]['value']['magnitude']
          unit = analyte['items'][2]['value']['unit']
          Analyte.new(name:, value:, unit:)
        end
        new(test_name:, analytes:)
      end
    end

    def from_fhir_json(json)
      fhir = FHIR.from_contents(json)
      LaboratoryTestReport.new(
        test_name: fhir.code.coding[0].display
      )
    end

    def from_flat_json(json)
      openehr = JSON.parse(json)
      LaboratoryTestReport.new(
        test_name: openehr['laboratorytestreport/laboratory_test_result/any_event:0/test_name']
      )
    end

    def from_mml(xml)
      mml = Nokogiri::XML.parse(xml)
      LaboratoryTestReport.new(
        test_name: mml.at('title').text
      )
    end
  end
end
