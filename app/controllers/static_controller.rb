class StaticController < ApplicationController

  def home
    if session[:developer_id]
      redirect_to developer_path(Developer.find(session[:developer_id]))
    else
      render :home
    end
  end

end