require 'spec_helper'

describe Proposal do

  it { should belong_to(:creative) }
  it { should belong_to(:project) }

end
