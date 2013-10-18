require 'spec_helper'

describe Developer do
  it { should have_many(:projects) }
  it { should validate_presence_of(:github_username) }
  it { should validate_uniqueness_of(:github_username)}


end

