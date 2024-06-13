# frozen_string_literal: true

require 'nokogiri'
require 'fhir_models'

class Analyte
  attr_accessor :name, :value, :unit
end

class LaboratoryTestReport
  include ActiveModel::API
  attr_accessor :test_name, :analytes

  class << self
    def all
      url = 'http://localhost:8080/ehrbase/rest/openehr/v1/query/aql'
      query = { q: "SELECT c FROM EHR e CONTAINS COMPOSITION c WHERE e/ehr_id/value='b3a123d3-86a9-46a9-a8b9-6ac9289abe97'" }
      response = HTTPClient.get(url, query)
      JSON.parse(response.body)['rows'].map do |diagnosis|
        name_value = name_code = name_terminology = onset = diagnostic_certainty = diagnostic_certainty_code = diagnostic_certainty_terminology = nil
        id = diagnosis[0]['uid']['value'].split(':')[0]
        diagnosis[0]['content'][0]['data']['items'].each do |item|
          case item['archetype_node_id']
          when 'at0002'
            name_value = item['value']['value']
            name_terminology = item['value']['defining_code']['terminology_id']['value']
            name_code = item['value']['defining_code']['code_string']
          when 'at0073'
            diagnostic_certainty = item['value']['value']
            diagnostic_certainty_code = item['value']['defining_code']['code_string']
            diagnostic_certainty_terminology = item['value']['defining_code']['terminology_id']['value']
          when 'at0077'
            onset = item['value']['value']
          end
        end
        new(id:, onset:, name_value:, name_terminology:, name_code:,
            diagnostic_certainty:, diagnostic_certainty_code:, diagnostic_certainty_terminology:)
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
      print mml.xpath('/Mml')
      LaboratoryTestReport.new(
        test_name: mml.xpath('/Mml/MmlBody/MmlModuleItem/docInfo/title').text
      )
    end
  end
end
