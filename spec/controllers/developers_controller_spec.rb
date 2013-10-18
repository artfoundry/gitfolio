require 'spec_helper'

describe DevelopersController do

  describe "GET developer#show" do
    let(:developer) {FactoryGirl.create(:developer)}
    it "assigns a developer with correct id" do
      get :show, {id: developer.github_username}
      expect(assigns(:developer)).to be_a(Developer)
    end
  end

  describe "POST developer#repositories" do
    before(:each) do
      @developer = Developer.create(github_username: 'nscricco')
      post :repositories, {id: @developer.github_username}
    end

    after(:each) do
      @developer.destroy
    end

    it "should return an array" do
      expect(assigns(:repositories)).to be_a(Array)
    end

    it "should return an array of user's repositories scraped from github" do
      expect(assigns(:repositories).map {|repo| repo[:name]}).to include('quote_racer')
    end

    it "should render a JSON object containing the user's repositories array" do
      expect(JSON.parse(response.body)).to be_a(Array)

    end

  end
end