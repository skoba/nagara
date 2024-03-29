require 'rails_helper'

RSpec.describe "Diagnoses", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/diagnosis/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/diagnosis/show"
      expect(response).to have_http_status(:success)
    end
  end

end
