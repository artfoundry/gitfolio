class AddRoleToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :role, :string
  end
end
