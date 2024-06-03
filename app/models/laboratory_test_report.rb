# frozen_string_literal: true

class LaboratoryTestReport
  include ActiveModel::API
  attr_accessor :test_name, :analyte_name, :result_name, :result_value, :result_unit

  class << self
    def from_fhir_json(json)
      fhir = JSON.parse(json)
      LaboratoryTestReport.new(
        test_name: fhir['contained'][0]['code']['text'],
        analyte_name: fhir['code']['text'],
        result_value: fhir['valueQuantity']['value'],
        result_unit: fhir['valueQuantity']['unit']
      )
    end

    def from_flat_json(json)
      openehr = JSON.parse(json)
      LaboratoryTestReport.new(
        test_name: openehr['laboratorytestreport/laboratory_test_result/any_event:0/test_name']
      )
    end
  end
end
