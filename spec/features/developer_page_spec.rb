require 'spec_helper'


feature 'user page' do
  let(:developer) { FactoryGirl.create(:developer_with_projects) }

  scenario 'page should display all projects' do
    visit developer_path(developer)
    expect(page).to have_content(developer.projects.first.title)
  end

  scenario "page should display a user's repositories" do
    developer = Developer.create(github_username: 'nscricco')
    visit developer_path(developer)
    expect(page).to have_content('quote_racer')
    developer.destroy
  end
end