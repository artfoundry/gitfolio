class Developer < ActiveRecord::Base
  validates_presence_of :github_username
  validates_uniqueness_of :github_username
  has_many :projects
  has_many :authorizations

  def to_param
    github_username
  end
end