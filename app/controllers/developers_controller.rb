class DevelopersController < ApplicationController
  def show
    @developer = Developer.find_by github_username: params[:id]
    @projects = @developer.projects
    @new_project = Project.new
    @repositories = @developer.return_all_repos(params[:id])
  end
  def update
    developer = Developer.find_by github_username: params[:id]
    developer.attributes = valid_params(params)
    developer.save

    redirect_to developer_path(developer)
  end
  def repositories
    developer = Developer.find_by github_username: params[:id]
    @repositories = developer.return_all_repos(params[:id])
    render json: @repositories
  end

  private

  def valid_params(params)
    params[:developer].permit(:name, :email, :location, :profession)
  end
end