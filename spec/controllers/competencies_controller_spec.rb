require 'rails_helper'

RSpec.describe CompetenciesController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all the competencies" do
      FactoryGirl.create :competency, name: "Nginx"
      FactoryGirl.create :competency, name: "Can juggle"
      get :index
      body = JSON.parse(response.body)
      competency_names = body.map { |c| c["name"]}

      expect(competency_names).to match_array(["Nginx", "Can juggle"])
    end

  end

  # describe "GET /movies" do
  #   it "returns all the movies" do
  #     FactoryGirl.create :movie, name: "The Lord of the Rings"
  #     FactoryGirl.create :movie, name: "The Two Towers"

  #     get "/movies", {}, { "Accept" => "application/json" }

  #     expect(response.status).to eq 200

  #     body = JSON.parse(response.body)
  #     movie_titles = body.map { |m| m["title"] }

  #     expect(movie_titles).to match_array(["The Lord of the Rings",
  #                                          "The Two Towers"])
  #   end

end
