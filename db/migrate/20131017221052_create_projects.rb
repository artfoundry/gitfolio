class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, :url
      t.text :markdown
      t.references :developer
      t.timestamps
    end
  end
end
