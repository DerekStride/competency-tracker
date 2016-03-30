require 'rails_helper'

describe SessionsController do
  before :all do
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      :provider => 'google_oauth2', 
      :uid => '113792992188462614663',
      :info => {
        :name => 'John Doe',
        :email => 'john@company.com',
        :first_name => 'John',
        :last_name => 'Doe'
      },
      :credentials => {
        :token => 'token',
        :refresh_token => 'another_token',
        :expires_at => 1234567890,
        :expires => true
      }
    })
  end


  before :each do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
  end

  describe "GET #create" do
    it "returns http success" do
      session[:user_id].should be nil
      get :create
      session[:user_id].should_not be nil
      response.should redirect_to root_url
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      response.should redirect_to root_url
    end
  end

end
