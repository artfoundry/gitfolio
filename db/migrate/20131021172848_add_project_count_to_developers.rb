class AddProjectCountToDevelopers < ActiveRecord::Migration
  def change
  	add_column :developers, :project_count, :integer
  end
end
