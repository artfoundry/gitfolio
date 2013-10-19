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

  describe "PATCH projects#update" do
    let(:project) { FactoryGirl.create(:project) }
    let(:new_project) { FactoryGirl.build(:project) }
    before(:each) do
      patch :update, {id: project.id,
        :project => {
          title: new_project.title,
          url: new_project.url
        }
      }
      project.reload
    end
    it "should update a project's information" do
      expect(project.title).to eql(new_project.title)
      expect(project.developer_id).not_to eql(new_project.developer_id)
    end

  end

end