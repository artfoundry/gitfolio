require 'spec_helper'

describe StaticController do

  describe "GET static#home" do
    let(:developer) { FactoryGirl.create(:developer)}

    it "should render the home page if no one is logged in" do
      get :home
      expect(response).to render_template("home")
    end

    it "should redirect to developer page if user already logged in" do
      session[:developer_id] = developer.id
      get :home
      expect(response).to redirect_to( developer_path(developer) )
    end

  end
end