class DevelopersController < ApplicationController
  def show
    @developer = Developer.find_by github_username: params[:id]
    @projects = @developer.projects
  end
end