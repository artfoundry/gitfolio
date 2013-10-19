require 'spec_helper'


feature 'user page' do

  #implement after decisions on views have been made
  xscenario 'page should display all projects' do
    developer = Developer.find_or_create_by(github_username: "nscricco")
    project = developer.projects.create(title: "some title")

    visit developer_path(developer)
    expect(page).to have_content(developer.projects.first.title)
    developer.destroy
    project.destroy
  end

end