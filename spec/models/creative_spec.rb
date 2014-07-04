require 'spec_helper'

describe Creative do

  it { should have_many(:projects).through(:skills) }

end
