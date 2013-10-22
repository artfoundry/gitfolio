require 'spec_helper'

describe Project do
  it { should belong_to(:developer) }
	describe "custom validations" do
		it "validates that a maximum of 5 projects can be added per developer" do
			developer = Developer.create(github_username: "test")
			6.times {developer.projects.create(title: "this project will save")}
		expect(developer.projects.count).to eq(5)
		end
 	 end
end