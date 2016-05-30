require 'rails_helper'

RSpec.describe CompetenciesController, type: :controller do
  let!(:rubiks) { create(:competency, name: "Can solve Rubik's cube") }
  let!(:juggle) { create(:competency, name: "Can juggle") }

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, format: :json
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all the competencies" do
      get :index, format: :json
      body = JSON.parse(response.body)
      competency_names = body.map { |c| c["name"]}

      expect(competency_names).to match_array(["Can solve Rubik's cube", "Can juggle"])
    end

  end

  describe "POST /competencies" do
  	it "creates a competency successfully" do
      expect { post :create, competency: { name: "Can juggle" }, format: :json }.to change{Competency.count}.by(1)
    end
  end

  describe "PUT /competencies/1" do
  	it "updates a competency successfully" do
  	  put :update, id: rubiks.id, competency: { name: "Can solve Sudoku" }, format: :json

      expect(rubiks.reload.name).to eq "Can solve Sudoku"
    end

    it "successfully updates a competency by adding a sub-competency" do
  	  # make juggle the sub-competency of rubiks
      skip
  	  # put :update, id: rubiks.id, competency: {competency: {id: juggle.id} }
  	  # expect(juggle.reload.topic).to eq rubiks
  	end
  end

end
