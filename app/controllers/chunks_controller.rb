class ChunksController < ApplicationController

  def create
    new_chunk = Chunk.create(valid_params(params))

    render nothing: true
  end

  private

  def valid_params(params)

    params[:describer].permit(:title, :url, :textfield) if params[:describer]

    params[:image].permit(:title, :url, :description) if params[:image]

    params[:code_snippet].permit(:title, :description, :code) if params[:code_snippet]


  end
end