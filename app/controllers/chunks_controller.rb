class ChunksController < ApplicationController

  def create
    new_chunk = Chunk.create(valid_params(params))

    render :text => "this is working"
  end

  private

  def valid_params(params)

    return params[:describer].permit(:title, :url, :textfield) if params[:describer]

    return params[:image].permit(:title, :url, :description) if params[:image]

    return params[:code_snippet].permit(:title, :description, :code) if params[:code_snippet]


  end
end