class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    if @authorization
      render :text => "Welcome back! You have already signed up."
    else
      developer = Developer.new(github_username: auth_hash['extra']['raw_info']["login"])
      developer.authorizations.build(provider: auth_hash["provider"], uid: auth_hash["uid"])
      developer.save
      render :text => auth_hash['extra']['raw_info']['login']
    end
  end
end


# auth_hash["user_info"]["name"], :email => auth_hash["user_info"]["email"]



