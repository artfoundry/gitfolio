require 'spec_helper'


feature 'user page' do
  let(:developer) { FactoryGirl.create(:developer_with_projects) }

  scenario 'page should display all projects' do
    visit developer_path(developer)
    expect(page).to have_content(developer.projects.first.title)
  end

end