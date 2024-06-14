# frozen_string_literal: true

class Analyte
  attr_accessor :name, :value, :unit

  def initialize(name:, value:, unit:)
    @name = name
    @value = value
    @unit = unit
  end
end