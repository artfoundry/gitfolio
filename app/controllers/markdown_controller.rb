require 'modules/markdowner'

class MarkdownController < ApplicationController
  include Markdowner

  def convert

    @html = markdown_convert(params[:markdown])

    render :json => @html
  end
end