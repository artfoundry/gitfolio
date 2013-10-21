class Project < ActiveRecord::Base
  belongs_to :developer
  validates :developer_id, presence: true
end