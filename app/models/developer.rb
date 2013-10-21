require "modules/githubdataloader.rb"

class Developer < ActiveRecord::Base
  include GitHubDataLoader
  validates_presence_of :github_username
  validates_uniqueness_of :github_username
  has_many :projects
  has_many :authorizations

  def to_param
    github_username
  end

  def all_repositories
    return_all_gists_and_repos(github_username)
  end

  def github_user_info
    return_user_info(github_username)
  end
end