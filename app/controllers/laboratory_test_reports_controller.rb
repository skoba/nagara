# frozen_string_literal: true

class LaboratoryTestReportsController < ApplicationController
  def index
    @laboratory_test_reports = LaboratoryTestReport.all
  end
end
