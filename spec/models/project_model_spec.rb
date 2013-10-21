require 'spec_helper'

describe Project do
  it { should belong_to(:developer) }
  it { should have_many(:chunks) }
end