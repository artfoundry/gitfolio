require 'spec_helper'

describe ProjectsController do
  let!(:developer) {FactoryGirl.create(:developer)}

  describe "POST projects#create" do

    it "saves a new project with valid input" do
      expect{
      session[:developer_id] = developer.id
      post :create, :project => {title: "some title"}
      }.to change{Project.count}.by(1)
    end
  end

  describe "POST projects#create_from_repos" do
    let(:developer) { FactoryGirl.create(:developer) }

    it "should create a project from a repository" do
      expect{
        post :create_from_repo, {
          owner: developer.github_username,
          name: "some repo",
          url: "someurl",
          description: "some description"}
      }.to change {Project.count}.by(1)
    end

  end

end