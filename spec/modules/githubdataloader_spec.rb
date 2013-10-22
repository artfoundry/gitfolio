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

  describe "return_all_gists_and_repos" do
    it "should return an array of hash objects, which include both gists and hashes" do
      files = GitHubDataLoader.return_all_gists_and_repos(user)
      expect(files).to be_a(Array)
      expect(files[0]).to be_a(Hash)
      expect(files[0].keys).to include(:name)
    end
  end

  describe "return_file_content" do
    it "returns a string equivalent to the content of the specified file" do
      file_content = GitHubDataLoader.return_file_content("dmill", "gitfolio", "spec/modules/githubdataloader_spec.rb")
      expect(file_content).to eq(File.read(__FILE__))
    end
  end

  describe "return_author_commits" do
    it "returns all of the commits for an author on a given repo" do
      commits = GitHubDataLoader.return_author_commits("dmill", "gitfolio")
      expect(commits[7]["sha"]).not_to be_empty
    end
  end

  describe "return_all_file_names_and_paths" do
    it "returns a hash cotaining all files in a repository" do
      all_files = GitHubDataLoader.return_all_file_names_and_paths("dmill", "gitfolio")
      expect(all_files).to include({"Gemfile" => "Gemfile"})
      expect(all_files).to include({"githubdataloader_spec.rb" => "spec/modules/githubdataloader_spec.rb"})
    end
  end
end
