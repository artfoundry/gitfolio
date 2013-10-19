class ProjectsController < ApplicationController

  def create_from_repo

    developer = Developer.find_by github_username: params[:owner]

    developer.projects.create(
      title: params[:name],
      url: params[:url],
      description: params[:description]
      )

    redirect_to developer_path(developer)
  end

end