require 'modules/markdowner'

class MarkdownController < ApplicationController
  include MarkDowner

  def convert

    @html = markdown_convert(params[:markdown])

    render :json => @html
  end
end