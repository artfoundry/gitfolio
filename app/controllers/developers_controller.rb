class DevelopersController < ApplicationController
  def show
    @developer = Developer.find_by github_username: params[:id]
    @projects = @developer.projects
    @repositories = @developer.return_all_repos(params[:id])
  end

  def repositories
    developer = Developer.find_by github_username: params[:id]
    @repositories = developer.return_all_repos(params[:id])
    render json: @repositories
  end
end