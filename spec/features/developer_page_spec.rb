require 'spec_helper'


feature 'user page' do
  developer = Developer.find_or_create_by(github_username: "nscricco")
  project = developer.projects.create(title: "some title")

  scenario 'page should display all projects' do
    visit developer_path(developer)
    expect(page).to have_content(developer.projects.first.title)

    developer.destroy
    project.destroy

  end

end