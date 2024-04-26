class LaboratoryTestReportsController < ApplicationController
  def def index
    @laboratory_test_reports = LaboratoryTestReport.all
  end
  
end
