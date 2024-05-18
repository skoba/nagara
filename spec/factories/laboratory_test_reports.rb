# frozen_string_literal: true

FactoryBot.define do
  factory :laboratory_test_report do
    test_name { '生化学検査' }
    analyte_name { '尿酸値' }
    result_value { ' 5.4' }
    result_unit { 'mg/dL' }
  end
end
