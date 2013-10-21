class CreateChunks < ActiveRecord::Migration
  def change
    create_table :chunks do |t|
      t.string :title, :type
      t.belongs_to :project
      t.timestamps
    end
  end
end
