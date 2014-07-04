require 'spec_helper'

describe Project do

  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:title).is_at_least(4) }
  it { should validate_presence_of(:description) }
  it { should ensure_length_of(:description).is_at_least(10) }
  it { should validate_presence_of(:about) }
  it { should ensure_length_of(:about).is_at_least(10) }
  it { should validate_presence_of(:closing_date) }

  it { should have_many(:requisite_skills) }
  it { should have_many(:skills).through(:requisite_skills) }

  it { should belong_to(:buyer) }

end
