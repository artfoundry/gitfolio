class AddGithubAvatarToDevelopers < ActiveRecord::Migration
  def change
  	add_column :developers, :github_avatar, :string
  end
end
