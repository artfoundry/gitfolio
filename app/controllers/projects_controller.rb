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

  def destroy
    project = Project.find(params[:id])
    Project.destroy(project)

    redirect_to developer_path(project.developer)
  end

  def get_files_for_repo
    developer = Developer.find_by github_username: params[:owner]

    developer.return_all_file_names_and_paths(developer.github_username,params[:repo][:name])
    

    redirect_to root_path
  end

  def update
    project = Project.find(params[:id])
    project.attributes = valid_params(params)
    project.save

    redirect_to developer_path(project.developer)
  end


  private

  def valid_params(params)
    params[:project].permit(:title, :url, :description, :role, :code_snippet)
  end

end