class AddCodeSnippetToProjects < ActiveRecord::Migration
  def change
    add_column :developers, :code_snippet, :text
  end
end
