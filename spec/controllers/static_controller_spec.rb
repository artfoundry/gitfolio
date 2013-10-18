require 'spec_helper'

describe StaticController do

  describe "GET static#home" do
    it "should render the home page" do
      get :home
      expect(response).to render_template("home")
    end
  end
end