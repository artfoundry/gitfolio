require 'spec_helper'

describe Authorization do
  it { should belong_to(:developer) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:uid)}
end