class AddProfessionToDevelopers < ActiveRecord::Migration
  def change
  	add_column :developers, :profession, :string
  end
end
