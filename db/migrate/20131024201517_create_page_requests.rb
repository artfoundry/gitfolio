class CreatePageRequests < ActiveRecord::Migration
  def change
    create_table :page_requests do |t|
      t.belongs_to :developer
      t.string :ip
      t.integer :visitor_id
      t.timestamps
    end
  end
end
