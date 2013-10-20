require 'spec_helper'

describe DevelopersController do

  describe "GET developer#show" do

    before(:each) do
      @developer = Developer.create(github_username: 'nscricco')
      post :repositories, {id: @developer.github_username}
    end

    after(:each) do
      @developer.destroy
    end

    it "assigns a developer with correct id" do
      get :show, {id: @developer.github_username}
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

  describe "PATCH developer#update" do
    let(:developer) {FactoryGirl.create(:developer)}
    let(:new_developer) {Developer.new(name: "Testy Testington",
                                       email: "test@example.com",
                                       location: "SF",
                                       profession: "QA",
                                       github_username: developer.github_username)}
     before(:each) do
      patch :update, {id: developer.github_username,
        :developer => {
          name: new_developer.name,
          email: new_developer.email,
          location: new_developer.location,
          profession: new_developer.profession
        }
      }
      developer.reload
    end
      it "updates a developer's information" do
      expect(developer.name).to eql(new_developer.name)
    end

    it "redirects to developer page" do
      expect(response).to redirect_to(developer)
    end
  end
end