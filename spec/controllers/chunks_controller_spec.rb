require 'spec_helper'

describe ChunksController do

  describe "POST#create" do
    let(:project) {FactoryGirl.create(:project)}

    it "should create a new describer chunk" do
    expect{
      post :create, :describer => {title: "some title", project_id: project.id}
    }.to change{Describer.count}.by(1)
    end

    it "should create a new code snippet chunk" do
    expect{
      post :create, :code_snippet => {title: "some title", code: "some code", project_id: project.id}
    }.to change{CodeSnippet.count}.by(1)
    end

    it "should create a new describer chunk" do
    expect{
      post :create, :image => {title: "some title", project_id: project.id}
    }.to change{Image.count}.by(1)
    end
  end

end
