class AddSourceToChunks < ActiveRecord::Migration
  def change
    add_column :chunks, :source, :text
  end
end
