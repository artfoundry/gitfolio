require 'spec_helper'

describe Developer do
  let(:developer) {FactoryGirl.create(:developer)}
  it { should have_many(:projects) }
  it { should validate_presence_of(:github_username) }
  it { should validate_uniqueness_of(:github_username)}

  it "should return an array of repos of a given developer" do
    expect(developer.all_repositories).to be_a(Array)
  end

  it "should return user_info for a given developer" do
    expect(developer.github_user_info).to be_a(Hash)
    expect(developer.github_user_info.keys).to include(:github_url)
  end

end

