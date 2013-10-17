class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :first_name, :last_name, :email, :github_username
      t.timestamps
    end
  end
end
