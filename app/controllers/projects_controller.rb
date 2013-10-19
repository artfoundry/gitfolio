class ProjectsController < ApplicationController

  def create_from_repo

    developer = Developer.find_by github_username: params[:owner]

    developer.projects.create(
      title: params[:title],
      url: params[:url],
      description: params[:description]
      )

    render nothing: true
  end

end