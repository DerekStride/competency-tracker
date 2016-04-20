require 'rails_helper'
require 'pp'

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

  describe "POST /competencies" do
  	it "creates a competency successfully" do
  	  post :create, competency: { name: "Can solve Rubik's cube" }
  	  
  	  get :index
  	  body = JSON.parse(response.body)

      competency_names = body.map { |c| c["name"]}

      expect(competency_names).to match_array(["Can solve Rubik's cube"])
    end
  end

  describe "PUT /competencies/1" do
  	it "updates a competency successfully" do
  	  post :create, competency: { name: "Can solve Rubik's cube" }
  	  
  	  get :index
  	  body = JSON.parse(response.body)
  	  id = body.first["id"]

  	  put :update, id: id, competency: { name: "Can solve Sudoku" }
 
  	  get :index
  	  body = JSON.parse(response.body)
  	  competency_names = body.map { |c| c["name"]}
      expect(competency_names).to match_array(["Can solve Sudoku"])
    end

    it "successfully updates a competency by adding a sub-competency" do
      post :create, competency: { name: "Can solve Rubik's cube" }
      post :create, competency: { name: "Can solve it in 30 seconds or less"}

  	  get :index
  	  body = JSON.parse(response.body)
  	  competency_names = body.map { |c| c["name"]}
  	  expect(competency_names).to match_array(["Can solve Rubik's cube", "Can solve it in 30 seconds or less"])

  	  id = body.first["id"]
  	  id2 = body.last["id"]

  	  # make id2 the sub-competency of id
  	  put :update, id: id, competency: {competency: {id: id2} }
  	  expect(Competency.last.topic).to eq Competency.first
  	end 
  end

end
