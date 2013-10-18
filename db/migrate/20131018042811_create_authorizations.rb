class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider, :uid
      t.references :developer
      t.timestamps
    end
  end
end
