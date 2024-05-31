# frozen_string_literal: true

require 'httpclient'
require 'nokogiri'

class Diagnosis
  include ActiveModel::API
  attr_accessor :ehr_id, :onset, :name_terminology, :name_code, :name_value, :id
  attr_accessor :diagnostic_certainty_terminology, :diagnostic_certainty_code, :diagnostic_certainty,
                :date_time_clinically_recognised

  def save
    url = 'http://localhost:8080/ehrbase/rest/ecis/v1/composition'
    params = { format: 'FLAT', templateId: 'ProblemList', ehrId: 'b3a123d3-86a9-46a9-a8b9-6ac9289abe97' }
    header = { content_type: 'application/json' }
    client = HTTPClient.new
    client.post(url, { query: params, body: flat_json, header: })
  end

  def to_fhir
    fhir_diagnostic_certainty = 'confirmed' if diagnostic_certainty == 'Confirmed'
    fhir_diagnostic_certainty = 'unconfirmed' if diagnostic_certainty == 'Suspected'
    fhir_name_terminology = 'urn:oid:2.16.840.1.113883.6.3' if name_terminology == 'ICD-10'
    <<~FHIR
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
              "code": "#{fhir_diagnostic_certainty}"
            }
          ]
        },
        "code": {
          "coding": [
            {
              "system": "#{fhir_name_terminology}",
              "code": "#{name_code}"
            }
          ],
          "text": "#{name_value}"
        },
        "subject": {
          "reference": "ehr_id:b3a123d3-86a9-46a9-a8b9-6ac9289abe97"
        },
        "onsetDateTime": {
          "value": "#{onset}"
        },
        "recordedDate": {
          "value": "#{date_time_clinically_recognised}"
        }
      }
    FHIR
  end

  def flat_json
    <<~FLAT
      {#{' '}
          "problemlist/category|code": "433",
          "problemlist/category|terminology": "openehr",
          "problemlist/category|value": "event",
          "problemlist/problem_diagnosis/problem_diagnosis_name|terminology": "#{name_terminology}",
          "problemlist/problem_diagnosis/problem_diagnosis_name|code": "#{name_code}",
          "problemlist/problem_diagnosis/problem_diagnosis_name|value": "#{name_value}",
          "problemlist/problem_diagnosis/date_time_of_onset": "#{onset}",
          "problemlist/problem_diagnosis/date_time_clinically_recognised": "#{date_time_clinically_recognised}",
          "problemlist/problem_diagnosis/diagnostic_certainty|terminology": "#{diagnostic_certainty_terminology}",
          "problemlist/problem_diagnosis/diagnostic_certainty|value": "#{diagnostic_certainty}",
          "problemlist/problem_diagnosis/diagnostic_certainty|code": "#{diagnostic_certainty_code}",
          "problemlist/territory|terminology": "ISO_3166-1",
          "problemlist/territory|code": "JP",
          "problemlist/composer|name": "Shinji KOBAYASHI"
      }
    FLAT
  end

  def to_mml
    mml_certainty_table = ''
    if diagnostic_certainty
      mml_certainty_table = 'MML0015'
      if diagnostic_certainty_code == 'at0076'
        mml_certainty_code = 'confirmedDiagnosis'
      elsif diagnostic_certainty_code == 'at0074'
        mml_certainty_code = 'suspectedDiagnosis'
      end
    end
    <<~MML
      <?xml version="1.0" encoding="UTF-8"?>
      <mmlRd:RegisteredDiagnosisModule
        xmlns:mmlRd="http://www.medxml.net/MML/v4/ContentModule/RegisteredDiagnosis/1.0"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.medxml.net/MML/v4/ContentModule/RegisteredDiagnosis/1.0/registereddiagnosis.xsd">
        <mmlRd:diagnosis mmlRd:code="#{name_code}" mmlRd:system="#{name_terminology}">#{name_value}</mmlRd:diagnosis>
        <mmlRd:categories>
          <mmlRd:category mmlRd:tableId="#{mml_certainty_table}">#{mml_certainty_code}</mmlRd:category>
        </mmlRd:categories>
        <mmlRd:startDate>#{onset}</mmlRd:startDate>
        <mmlRd:firstEncounterDate>#{date_time_clinically_recognised}</mmlRd:firstEncounterDate>
      </mmlRd:RegisteredDiagnosisModule>
    MML
  end

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
    end

    def find(id)
      url = "http://localhost:8080/ehrbase/rest/openehr/v1/ehr/b3a123d3-86a9-46a9-a8b9-6ac9289abe97/composition/#{id}"
      response = HTTPClient.get(url)
      diagnosis = JSON.parse(response.body)
      name_value = name_code = name_terminology = onset = diagnostic_certainty = diagnostic_certainty_code = diagnostic_certainty_terminology = nil
      diagnosis['content'][0]['data']['items'].each do |item|
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

    def parse_from_fhir(json)
      hash = JSON.parse(json)
      diagnostic_certainty = ''
      diagnostic_certainty_code = ''
      if hash['verificationStatus']['coding'][0]['code'] == 'confirmed'
        diagnostic_certainty = 'Confirmed'
        diagnostic_certainty_code = 'at0076'
      elsif hash['verificationStatus']['coding'][0]['code'] == 'unconfirmed'
        diagnostic_certainty = 'Suspected'
        diagnostic_certainty_code = 'at0074'
      end
      diagnostic_certainty_terminology = 'local'
      new(onset: hash['onsetDateTime']['value'],
          name_terminology: hash['code']['coding'][0]['system'],
          name_code: hash['code']['coding'][0]['code'],
          name_value: hash['code']['text'],
          diagnostic_certainty_terminology:,
          diagnostic_certainty_code:,
          diagnostic_certainty:,
          date_time_clinically_recognised: hash['recordedDate']['value'])
    end

    def parse_from_mml(xml)
      mml = Nokogiri::XML(xml)
      certainty = mml.xpath("//mmlRd:categories/mmlRd:category[@mmlRd:tableId='MML0015']")
      diagnostic_certainty = ''
      diagnostic_certainty_code = ''
      if certainty.present?
        diagnostic_certainty_terminology = 'local'
        if certainty.text == 'confirmedDiagnosis'
          diagnostic_certainty = 'Confirmed'
          diagnostic_certainty_code = 'at0076'
        elsif certainty.text == 'suspectedDiagnosis'
          diagnostic_certainty = 'Suspected'
          'at0074'
        end
      end
      new(onset: mml['mmlRd:startDate'],
          name_terminology: mml.xpath('//mmlRd:diagnosis[@mmlRd:system]'),
          name_code: mml.xpath('//mmlRd:diagnosis[@mmlRd:code]'),
          name_value: mml.xpath('//mmlRd:diagnosis'),
          diagnostic_certainty:,
          diagnostic_certainty_code:,
          diagnostic_certainty_terminology:,
          date_time_clinically_recognised: mml['mmlRd:firstEncounterDate'])
    end
  end
end
