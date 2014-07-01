require 'spec_helper'

describe Skill do

  it { should have_many(:expertise) }
  it { should have_many(:users).through(:expertise) }

end
