class ChunksController < ApplicationController

  def create
    new_chunk = Chunk.create(valid_params(params))

    render :text => params
  end

  private

  def valid_params(params)

    return params[:describer].permit(:title, :url, :textfield, :project_id) if params[:describer]

    return params[:image].permit(:title, :url, :description, :project_id) if params[:image]

    return params[:code_snippet].permit(:title, :description, :code, :url, :project_id) if params[:code_snippet]


  end
end