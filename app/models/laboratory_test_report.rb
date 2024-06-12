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
        test_name: mml.xpath('/mmlLb:TestModule/mmlLb:information/mmlLb:set').text
      )
    end
  end
end
