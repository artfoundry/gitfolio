class SessionsController < ApplicationController
  include GitHubDataLoader
  def create
    auth_hash = request.env['omniauth.auth']

    authorization_count = Authorization.count
    auth = Authorization.find_or_create(auth_hash)
    developer = auth.developer
    developer_info = GitHubDataLoader.return_user_info(developer.github_username)
    developer.github_avatar = developer_info[:github_avatar_link]
    developer.save
    session[:developer_id] = developer.id
    authorization_count != Authorization.count ? @new_user = true : @new_user = false
    redirect_to developer_path(developer)
  end

  def destroy
    session[:developer_id] = nil
    redirect_to root_path
  end
end
