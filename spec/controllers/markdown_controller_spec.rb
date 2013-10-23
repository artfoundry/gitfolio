require 'spec_helper'

describe MarkdownController do

  describe "markdown#convert" do
    markdown = "A First Level Header
====================

A Second Level Header
---------------------"
    html = "<h1>A First Level Header</h1>\n\n<h2>A Second Level Header</h2>"

    it "should convert text string to markdown" do
      post :convert, {markdown: markdown}
      expect(assigns(:html)).to eq(html)
    end

    it "should render a json object" do
      post :convert, {markdown: markdown}
      expect(response.body).to eq(html)
    end

  end
end