require "modules/githubdataloader.rb"

class Project < ActiveRecord::Base
  include GitHubDataLoader
  include ActiveModel::Validations
  belongs_to :developer
  has_many :chunks
  has_many :images
  has_many :describers
  has_many :code_snippets
  validates_with ProjectMaximumValidator

  def get_forks
	return_number_of_forks(self.developer.github_username, self.title)
  end

end