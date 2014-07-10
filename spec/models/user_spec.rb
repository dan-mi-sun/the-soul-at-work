require 'spec_helper'

describe User do

  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:type) }

  it { should have_many(:expertise) }
  it { should have_many(:skills).through(:expertise) }

  it { should have_many(:user_languages) }
  it { should have_many(:languages).through(:user_languages) }

  it { should have_many(:incoming_messages) }
  it { should have_many(:outgoing_messages) }

end
