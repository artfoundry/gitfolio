class CreateChunks < ActiveRecord::Migration
  def change
    create_table :chunks do |t|
      t.string :title, :type, :url
      t.text :description, :textfield, :code
      t.belongs_to :project
      t.timestamps
    end
  end
end
