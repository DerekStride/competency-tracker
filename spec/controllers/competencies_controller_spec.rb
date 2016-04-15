require 'rails_helper'

RSpec.describe CompetenciesController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all the competencies" do
      FactoryGirl.create :competency
      FactoryGirl.create :competency, name: "Can juggle"
      get :index
      body = JSON.parse(response.body)
      competency_names = body.map { |c| c["name"]}

      expect(competency_names).to match_array(["Nginx", "Can juggle"])
    end

  end

  describe "PUT /competencies" do
  	it "creates a competency successfully" do
  	  competency_params = {
  	  	"competency" => {
  	  		"name" => "Can solve Rubik's cube"
  	  	}
  	  }.to_json
  	  post "/competencies.json", competency_params
  	  expect(response).to have_http_status(201)
  	  get :index
  	  body = JSON.parse(response.body)
      competency_names = body.map { |c| c["name"]}

      expect(competency_names).to match_array(["Can solve Rubik's cube"])
    end
  end

end
