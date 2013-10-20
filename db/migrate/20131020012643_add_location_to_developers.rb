class AddLocationToDevelopers < ActiveRecord::Migration
  def change
  	add_column :developers, :location, :string
  end
end
