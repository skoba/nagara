class LaboratoryTestResultsController < ApplicationController
  def def index
    @laboratory_test_results = LaboratoryTestResult.all
  end
  
end
