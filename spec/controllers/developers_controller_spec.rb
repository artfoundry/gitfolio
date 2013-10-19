require 'spec_helper'

describe DevelopersController do
  let!(:developer) {FactoryGirl.create(:developer)}
  before(:each) do
    session = {developer_id: developer.id}
  end
  describe "GET developer#show" do
    it "assigns a developer with correct id" do
      get :show, {id: developer.github_username}
      expect(assigns(:developer)).to be_a(Developer)
    end
  end
end