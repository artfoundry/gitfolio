require 'spec_helper'

describe Chunk do
  it { should belong_to(:project) }
end