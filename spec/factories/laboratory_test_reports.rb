# frozen_string_literal: true

FactoryBot.define do
  factory :laboratory_test_report do
    test_name { '生化学検査' }
    analyte_name { '尿酸' }
    result_value { 8.5 }
    result_unit { 'mg/dL' }
  end
end
