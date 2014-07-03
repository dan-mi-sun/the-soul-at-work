require 'spec_helper'

describe Skill do

  it { should have_many(:expertise) }
  it { should have_many(:users).through(:expertise) }

  it { should have_many(:requisite_skills) }
  it { should have_many(:projects).through(:requisite_skills) }

end
