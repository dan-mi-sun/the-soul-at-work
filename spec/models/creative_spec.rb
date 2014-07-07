require 'spec_helper'

describe Creative do

  it { should have_many(:projects).through(:skills) }

  it { should have_many(:proposals) }
  it { should have_many(:pitches).through(:proposals) }

end
