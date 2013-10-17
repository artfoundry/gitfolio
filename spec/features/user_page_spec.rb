require 'spec_helper'


feature 'user page' do
  let(:user) { FactoryGirl.create(:user_with_projects) }

  scenario 'page should display all github repos' do
    visit user_path(user)
    expect(page).to have_content(user.projects.first.title)
  end
end