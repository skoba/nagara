# frozen_string_literal: true

FactoryBot.define do
  factory :laboratory_test_report do
    test_name { '検体検査報告書' }
    analytes { [build(:wbc), build(:rbc), build(:hb), build(:hct), build(:plt)] }
  end

  factory :wbc, class: 'Analyte' do
    name { '白血球数' }
    value { 6.8 }
    unit { '10*3/uL' }
  end

  factory :rbc, class: 'Analyte' do
    name { '赤血球数' }
    value { 4.05 }
    unit { '10*6/uL' }
  end

  factory :hb, class: 'Analyte' do
    name { '血色素量' }
    value { 13.0 }
    unit { 'g/dL' }
  end

  factory :hct, class: 'Analyte' do
    name { 'ヘマトクリット' }
    value { 40.1 }
    unit { '%' }
  end

  factory :plt, class: 'Analyte' do
    name { '血小板数' }
    value { 309 }
    unit { '10*3/uL' }
  end

end
