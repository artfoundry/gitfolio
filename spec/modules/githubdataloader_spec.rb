require "modules/githubdataloader.rb"

describe "GitHubDataLoader" do
  user = 'raorao'
  describe "return_all_repos" do
    it "should return an array of hash objects, each describing a repository" do
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

  describe "return_all_gists" do
    it "should return an array of hash objects, each describing a gist" do
      gists = GitHubDataLoader.return_all_gists(user)
      expect(gists).to be_a(Array)
      expect(gists[0]).to be_a(Hash)
      expect(gists[0].keys).to include(:name)
    end
  end

  describe "return_all_files" do
    it "should return an array of hash objects, which include both gists and hashes" do
      files = GitHubDataLoader.return_all_files(user)
      expect(files).to be_a(Array)
      expect(files[0]).to be_a(Hash)
      expect(files[0].keys).to include(:name)
    end
  end
end
