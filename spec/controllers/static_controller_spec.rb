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

  describe "POST static#files_from_repo" do
    repo = { owner: "raorao", url: "https://github.com/raorao/ar-student-schema"}
    it "should render a JSON object of files" do
      get :files_from_repo, repo
      expect(response).to be_a(Hash)
    end

  end
end