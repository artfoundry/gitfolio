class ReplaceFirstAndLastNameWithNameInDevelopers < ActiveRecord::Migration
  def change
  	remove_column :developers, :first_name
  	remove_column :developers, :last_name
  	add_column :developers, :name, :string
  end
end
