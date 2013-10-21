class Project < ActiveRecord::Base
  belongs_to :developer, counter_cache: :project_count
  validates :developer_id, presence: true
  validate :maximum_of_five_per_developer

  def maximum_of_five_per_developer

  end
end