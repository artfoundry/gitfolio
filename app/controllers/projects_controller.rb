require 'modules/githubdataloader'

class ProjectsController < ApplicationController
  include GitHubDataLoader

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

  def destroy
    project = Project.find(params[:id])
    Project.destroy(project)

    redirect_to developer_path(project.developer)
  end

  def create_from_repo

    readme = return_readme(params[:owner], params[:name])

    developer = Developer.find_by github_username: params[:owner]
    developer.projects.create(
      title: params[:name],
      url: params[:url],
      markdown: readme
      )

    redirect_to developer_path(developer)
  end

  def update
    project = Project.find(params[:id])
    project.attributes = valid_params(params)
    project.save

    redirect_to developer_path(project.developer)
  end


  private

  def valid_params(params)
    params[:project].permit(:title, :url, :markdown, :role)
  end

end