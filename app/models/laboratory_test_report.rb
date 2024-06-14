# frozen_string_literal: true

require 'nokogiri'
require 'fhir_models'

class LaboratoryTestReport
  include ActiveModel::API
  attr_accessor :test_name, :analytes

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
      mml = Nokogiri::XML(xml)
      LaboratoryTestReport.new(
        test_name: mml.xpath('/Mml/MmlBody/MmlModuleItem/docInfo/title').text
      )
    end
  end
end
