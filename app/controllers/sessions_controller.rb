class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    authorization_count = Authorization.count
    auth = Authorization.find_or_create(auth_hash)
    developer = auth.developer
    session[:developer_id] = developer.id
    authorization_count != Authorization.count ? @new_user = true : @new_user = false
    redirect_to developer_path(developer)
  end

  def destroy
    session[:developer_id] = nil
    render :text => "You've logged out!"
  end
end
