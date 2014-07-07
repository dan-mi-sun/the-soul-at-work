class Project < ActiveRecord::Base

   validates_length_of :title, :minimum => 4, :allow_blank => false  
   validates_length_of :description, :minimum => 10, :allow_blank => false 
   validates_length_of :about, :minimum => 10, :allow_blank => false 
   validates_presence_of :closing_date

   has_many :requisite_skills
   has_many :skills, :through => :requisite_skills

   has_many :creatives, :class_name => "User", :through => :skills

   belongs_to :buyer


  def relevant_projects(creative)
    @projects.each do |project| 
    project.skills.where(:skill => creative.skills.ids)
    end
  end

end