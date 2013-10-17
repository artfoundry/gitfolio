class Developer < ActiveRecord::Base
  validates_presence_of :github_username
  has_many :projects
end