class DiagnosesController < ApplicationController
  def index
    @diagnoses = Diagnosis.all
  end

  def show
    @diagnosis = Diagnosis.find(params[:id])
    respond_to do |format|
      format.html { render "show", format: :html}
      format.json { render json: @diagnosis.to_fhir }
      format.xml { render xml: @diagnosis.to_mml }
    end
  end
end
