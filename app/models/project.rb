class Project < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :developer
  validates_with ProjectMaximumValidator 
 
end