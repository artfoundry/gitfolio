class Project < ActiveRecord::Base
  belongs_to :developer
  has_many :chunks
  has_many :images
  has_many :describers
  has_many :code_snippets
end