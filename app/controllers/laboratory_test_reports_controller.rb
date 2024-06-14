# frozen_string_literal: true

class LaboratoryTestReportsController < ApplicationController
  def index
    @laboratory_test_reports = LaboratoryTestReport.all
  end

  def show
    @laboratory_test_report = LaboratoryTestReport.find(params[:id])
    respond_to do |format|
      format.html { render 'show', format: :html }
      format.json { render json: @laboratory_test_report.to_fhir }
      format.xml { render xml: @laboratory_test_report.to_mml }
    end
  end
end
