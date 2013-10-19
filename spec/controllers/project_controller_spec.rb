require 'spec_helper'


describe ProjectsController do

  describe "POST projects#create_from_repos" do

    it "should create a project from a repository" do
      expect{
        post :create_from_repo, {name: "some repo", url: "someurl", descrption: "some description"}
      }.to change {Project.count}.by(1)

    end

  end


end