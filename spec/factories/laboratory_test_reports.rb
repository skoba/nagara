# frozen_string_literal: true

FactoryBot.define do
  factory :laboratory_test_report do
    test_name { '検体検査報告書' }
    wbc = Analyte.new(name: '白血球数', value: 6.8, unit: '10*3/uL')
    rbc = Analyte.new(name: '赤血球数', value: 4.05, unit: '10*6/uL')
    hb  = Analyte.new(name: '血色素量', value: 13.0, unit: 'g/dL')
    hct = Analyte.new(name: 'ヘマトクリット', value: 40.1, unit: '%')
    plt = Analyte.new(name: '血小板数', value: 309, unit: '10*3/uL')
    analytes { [wbc, rbc, hb, hct, plt] }
  end
end
