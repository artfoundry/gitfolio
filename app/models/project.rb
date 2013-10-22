class Project < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :developer
  has_many :chunks
  has_many :images
  has_many :describers
  has_many :code_snippets
  validates_with ProjectMaximumValidator

end