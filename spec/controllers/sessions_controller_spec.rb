require 'spec_helper'

describe SessionsController do
  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  end
  describe "GET sessions#create" do

    it "should assign a developer_id to session" do
    	get :create, provider: 'github'
    	expect(session[:developer_id]).to be_a(Integer)
    end

    it "should redirect to correct developer show page" do
      get :create, provider: 'github'
      expect(response).to redirect_to( edit_developer_path("test_username") )
    end

  end

  describe "GET sessions#destroy" do

    it "should remove a developer_id from the session" do
      get :destroy, provider: 'github'
      expect(session[:developer_id]).to be_nil
    end

  end
end