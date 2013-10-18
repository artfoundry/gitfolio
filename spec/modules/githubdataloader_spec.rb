require "modules/githubdataloader.rb"

describe "GitHubDataLoader" do
  user = 'raorao'
  describe "return_all_repos" do
    it "should return an array of has objects, each describing a repository" do
      repositories = GitHubDataLoader.return_all_repos(user)
      expect(repositories).to be_a(Array)
      expect(repositories[0]).to be_a(Hash)
      expect(repositories[0].keys).to include(:name)
    end
  end

  describe "return_user_info" do
    it "should return a user's github information as a hash" do
      user_info = GitHubDataLoader.return_user_info(user)
      expect(user_info).to be_a(Hash)
      expect(user_info[:github_email]).to eql("savinirs@gmail.com")
    end
  end
end
