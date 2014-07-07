require 'spec_helper'

describe User do

  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:type) }

  it { should have_many(:expertise) }
  it { should have_many(:skills).through(:expertise) }

  it { should have_many(:user_languages) }
  it { should have_many(:languages).through(:user_languages) }

  describe "relevant projects" do

    before do
      @creative = Creative.new
    end

    context "a creative sees a list of relevant projects by expertise" do
      before do
        @creative.skills = Skill.create!(:name => "Ruby")
        @creative.save!
      end

      it "should store creatives skill" do
        expect(@creative.skills).to eq("Ruby")
      end
    end
  end

  # describe "imperial height" do
  #   
  #   before do 
  #     @user = User.new
  #   end
  #
  #   context "storing as metric" do
  #     before do
  #       @user.imperial_height = "6' 2"
  #     end
  #
  #     it "should store the height as metric" do
  #       expect(@user.height).to eq(187.96)
  #     end 
  #   end
  #   
  #   context "retrieving from metric" do
  #     before do
  #       @user.height = 187.96
  #     end
  #
  #     it "should convert the height as imperial" do
  #       expect(@user.imperial_height).to eq("6' 2")
  #     end 
  #   end
  #
  # end

end
