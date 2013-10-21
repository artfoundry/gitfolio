class StaticController < ApplicationController
  # include GitHubDataLoader

  def home
    if session[:developer_id]
      redirect_to developer_path(Developer.find(session[:developer_id]))
    else
      render :home
    end
  end

  def files_from_repo

    render :json => params
  end

end