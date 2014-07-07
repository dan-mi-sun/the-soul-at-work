require 'spec_helper'

describe Proposal do

  it { should ensure_length_of(:title).is_at_least(4) }
  it { should ensure_length_of(:description).is_at_least(10) }
  it { should ensure_length_of(:about).is_at_least(10) }

  it { should belong_to(:creative) }
  it { should belong_to(:project) }

end
