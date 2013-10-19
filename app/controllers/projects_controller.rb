class ProjectsController < ApplicationController
  def create
    project = Project.new(valid_params(params))
    project.developer_id = session[:developer_id]
    if project.save
      @developer = Developer.find(session[:developer_id])
      redirect_to developer_path(@developer)
    else
      redirect_to root_path
    end

  end

  private

  def valid_params(params)
    params[:project].permit(:title, :url, :description, :role)
  end
end