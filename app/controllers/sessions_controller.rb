class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    auth = Authorization.find_or_create(auth_hash)
    session[:developer_id] = auth.developer.id

    render :text => "Welcome #{auth.developer.github_username}!"
  end

  def destroy
    session[:developer_id] = nil
    render :text => "You've logged out!"
  end
end
