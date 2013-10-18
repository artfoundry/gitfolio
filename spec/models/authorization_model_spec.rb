require 'spec_helper'

describe Authorization do
  it { should belong_to(:developer) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:uid)}

  describe "finding or creating a developer from auth-hash" do
	  it "finds an existing developer's authorization" do
	 	Authorization.create(provider: "testing", uid: "123456")
		auth_hash = {"provider" => "testing", "uid" => "123456"}

	  	expect(Authorization.find_or_create(auth_hash).uid).to eq(auth_hash["uid"])
	  	expect(Authorization.find_or_create(auth_hash).provider).to eq("testing")
	  end

	  it "does not create a new developer for existing auth info" do
	  	developer_count = Developer.count
	  	Authorization.create(provider: "testing", uid: "1")
	  	auth_hash = {"provider" => "testing", "uid" => "1"}

	  	expect(Developer.count).to eq(developer_count)
	  end

	  it "creates a new developer for new auth_info" do
	  	auth_hash = {"provider" => "this", "uid" => "4", "extra" => {"raw_info" => {"login" => "test_ghub"}}}
	  	new_auth = Authorization.find_or_create(auth_hash)

	  	expect(Developer.last.github_username).to eq("test_ghub")
	  end

	  it "creates a new authorization if authorization for provided provider and uid does not yet exist" do
	  	auth_hash = {"provider" => "new_provider", "uid" => "654321", "extra" => {"raw_info" => {"login" => "test_github_username"}}}
	  	new_auth = Authorization.find_or_create(auth_hash)

	  	expect(new_auth.uid).to eq("654321")
	  	expect(new_auth.provider).to eq("new_provider")
	  end
  end
end