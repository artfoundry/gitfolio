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
    end

    after(:each) do
      @developer.destroy
    end

    it "should show a developer's repositories" do
      post :repositories, {id: @developer.github_username}
      expect(assigns(:repositories).map {|repo| repo[:name]}).to include('quote_racer')
    end

  end
end