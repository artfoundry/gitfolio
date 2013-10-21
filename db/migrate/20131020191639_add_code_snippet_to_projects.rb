class AddCodeSnippetToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :code_snippet, :text
  end
end
