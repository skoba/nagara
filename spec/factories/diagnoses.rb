# frozen_string_literal: true

FactoryBot.define do
  factory :diagnosis do
    onset { '2002-01-25' }
    name_terminology { 'ICD-10' }
    name_code { 'E790-.003' }
    name_value { '高尿酸血症' }
    diagnostic_certainty_terminology { 'local' }
    diagnostic_certainty_code { 'at0076' }
    diagnostic_certainty { 'Confirmed' }
    date_time_clinically_recognised { '2002-01-25' }
  end
end
