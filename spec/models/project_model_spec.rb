require 'spec_helper'

describe Project do
  it { should belong_to(:developer) }
  it { should have_many(:chunks) }
  it { should have_many(:chunks) }
  it { should have_many(:code_snippets) }
  it { should have_many(:describers) }

end