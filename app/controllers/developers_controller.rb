require 'modules/markdowner'
require 'modules/geolocator'

class DevelopersController < ApplicationController
  include Markdowner
  include Geolocator

  def show
    @developer = Developer.find_by github_username: params[:id]

    @developer.page_requests.create(ip: request.remote_ip, visitor_id: session[:developer_id]) if session[:developer_id] != @developer.id
    requests = @developer.page_requests.map { |request| request.ip }
    @viewers = return_location_data(requests)

    @projects = @developer.projects
    @html_projects = @projects.each {|project| project.markdown = markdown_convert(project.markdown).html_safe }
    @projects.reload

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