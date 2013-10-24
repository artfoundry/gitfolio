require "modules/githubdataloader.rb"

class Project < ActiveRecord::Base
  include GitHubDataLoader
  include ActiveModel::Validations
  belongs_to :developer
  validates_with ProjectMaximumValidator

  def get_forks
	return_number_of_forks(self.developer.github_username, self.repo_name)
  end

  def get_stars
	return_number_of_stars(self.developer.github_username, self.repo_name)
  end

  def short_title
    return title[0..10] + "..." if title && title.length > 10
    title if title
  end
end