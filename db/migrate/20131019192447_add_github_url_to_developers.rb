class AddGithubUrlToDevelopers < ActiveRecord::Migration
  def change
  	add_column :developers, :github_url, :string
  end
end
