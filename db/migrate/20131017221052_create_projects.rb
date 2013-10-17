class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, :url
      t.text :description
      t.references :developer
      t.timestamps
    end
  end
end
