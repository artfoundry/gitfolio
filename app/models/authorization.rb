class Authorization < ActiveRecord::Base
  belongs_to :developer
  validates :provider, :uid, :presence => true
end