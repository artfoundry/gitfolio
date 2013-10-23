class AddWatchersAndCommitsToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :watchers, :integer
  	add_column :projects, :commits, :integer
  end
end
