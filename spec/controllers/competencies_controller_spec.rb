require 'rails_helper'

RSpec.describe CompetenciesController, type: :controller do

  before :each do
  	FactoryGirl.create :competency, name: "Can solve Rubik's cube"
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all the competencies" do
      FactoryGirl.create :competency, name: "Can juggle"
      get :index
      body = JSON.parse(response.body)
      competency_names = body.map { |c| c["name"]}

      expect(competency_names).to match_array(["Can solve Rubik's cube", "Can juggle"])
    end
  end

  describe "GET /competencies/:id" do
  	it "returns a requested competency" do
  	  get :show, id: Competency.last.id
  	  expect(response).to be_success
  	  body = JSON.parse(response.body)

      expect(body["name"]).to eq "Can solve Rubik's cube"
    end
  end

  describe "POST /competencies" do
  	it "creates a competency successfully" do 	 
      expect {post :create, competency: { name: "Can juggle" }}.to change{Competency.count}.by(1)
    end
  end

  describe "PUT /competencies/1" do
  	it "updates a competency successfully" do
  	  id = Competency.first.id
  	  put :update, id: id, competency: { name: "Can solve Sudoku" }
 
      expect(Competency.first.name).to eq "Can solve Sudoku"

    end

    it "successfully updates a competency by adding a sub-competency" do
      post :create, competency: { name: "Can solve it in 30 seconds or less"}

  	  id = Competency.first.id
  	  id2 = Competency.last.id

  	  # make id2 the sub-competency of id
  	  put :update, id: id, competency: {competency: {id: id2} }
  	  expect(Competency.last.topic).to eq Competency.first
  	end 
  end

end
