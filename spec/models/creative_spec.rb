require 'spec_helper'

describe Creative do

  it { should have_many(:projects).through(:skills) }

  describe "relevant projects" do
    before do
      @skill = Skill.create!(:name => "Ruby")
      @project = Project.new(:title => "Title", :description => "This is the description",
                            :about => "This is the about", :closing_date => "2014-07-06")
      @project.skills << @skill 
      @project.save!

      @creative = User.new(:username => "Alan", :type => "Creative", :email => "email@email.com", :password => "password" )
      @creative.skills << @skill 
      @creative.save!
    end

    it "should return creatives relevant projects" do
      result = @creative.relevant_projects
      expect(result.first.title).to eq("Title")
    end
  end

end
