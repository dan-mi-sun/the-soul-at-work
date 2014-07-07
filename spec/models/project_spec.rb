require 'spec_helper'

describe Project do

  it { should ensure_length_of(:title).is_at_least(4) }
  it { should ensure_length_of(:description).is_at_least(10) }
  it { should ensure_length_of(:about).is_at_least(10) }
  it { should validate_presence_of(:closing_date) }

  it { should have_many(:requisite_skills) }
  it { should have_many(:skills).through(:requisite_skills) }

  it { should have_many(:creatives).through(:skills) }

  it { should belong_to(:buyer) }

  describe "relevant projects" do
    before do
      @project = Project.new(:title => "Title", :description => "This is the description",
                            :about => "This is the about", :closing_date => "2014-07-06")
      @project.skills = Skill.create!(:name => "Ruby")
      @project.save!

      @creative = User.new(:username => "Alan", :type => "Creative" )
      @creative.skills = Skill.create!(:name => "Ruby")
      @creative.save!
    end

    it "should return creatives relevant projects" do
      result = @project.relevant_projects(@creative)
      expect(result).to eq("Title")
    end

  end
end
