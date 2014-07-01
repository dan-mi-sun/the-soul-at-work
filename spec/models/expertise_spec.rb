require 'spec_helper'

describe Expertise do
  
  it { should belong_to(:user) }
  it { should belong_to(:skill) }
end
