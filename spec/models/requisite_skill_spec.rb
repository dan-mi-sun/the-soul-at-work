require 'spec_helper'

describe RequisiteSkill do

  it { should belong_to(:project) }
  it { should belong_to(:skill) }

end
