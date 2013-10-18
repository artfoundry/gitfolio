require 'spec_helper'

describe Developer do
  it { should have_many(:projects) }
  it { should validate_presence_of(:github_username) }
end