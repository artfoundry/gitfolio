require 'spec_helper'

describe DevelopersController do

  describe "GET developer#show" do
    let(:developer) {FactoryGirl.create(:developer)}
    it "assigns a developer with correct id" do
      get :show, {id: developer.github_username}
      expect(assigns(:developer)).to be_a(Developer)
    end
  end
end