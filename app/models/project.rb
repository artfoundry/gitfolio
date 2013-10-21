class Project < ActiveRecord::Base
  belongs_to :developer
  has_many :chunks
end