class ChunksController < ApplicationController

  def create
    new_chunk = Chunk.create(valid_params(params))

    render :text => params
  end

  private

  def valid_params(params)

    return params[:describer].permit(:title, :url, :textfield, :project_id, :type) if params[:describer]

    return params[:image].permit(:title, :url, :source :description, :project_id, :type) if params[:image]

    return params[:code_snippet].permit(:title, :description, :code, :url, :project_id, :type) if params[:code_snippet]


  end
end