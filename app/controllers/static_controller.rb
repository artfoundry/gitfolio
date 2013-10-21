require 'modules/githubdataloader'

class StaticController < ApplicationController
  include GitHubDataLoader

  def home
    if session[:developer_id]
      redirect_to developer_path(Developer.find(session[:developer_id]))
    else
      render :home
    end
  end

  def files_from_repo
    @files_hash = return_all_file_names_and_paths(params[:owner], params[:name])
    @files_hash = { repo_name: params[:name], owner: params[:owner], files: @files_hash }

    render :json => @files_hash
  end

  def get_file_info
    @file_content = return_file_content(params["owner"], params["repo"], params["path"])

    render :json => @file_content
  end

end