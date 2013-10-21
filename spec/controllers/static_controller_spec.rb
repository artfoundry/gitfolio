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
    repo = { owner: "raorao", name: "ar-student-schema"}

    it "should render a JSON object of files" do
      get :files_from_repo, repo
      expect(assigns(:files_hash)).to be_a(Hash)
      expect(assigns(:files_hash).keys).to include(:owner,:files)

    end
  end

  describe "POST static#get_file_info" do
    file_info = {owner: "raorao", path: "Gemfile", repo: "ar-student-schema" }

    it "should return a hash of file information given a user, repo, and path" do
      get :get_file_info, file_info
      expect(assigns(:file_content)).to be_a(String)
      expect(assigns(:file_content)).to eql("source 'https://rubygems.org'\n\ngem 'activerecord', :require => 'active_record'\n")

    end
  end

end