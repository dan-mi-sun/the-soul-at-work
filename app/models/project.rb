class Project < ActiveRecord::Base

   validates_length_of :title, :minimum => 4, :allow_blank => false  
   validates_length_of :description, :minimum => 10, :allow_blank => false 
   validates_length_of :about, :minimum => 10, :allow_blank => false 
   validates_presence_of :closing_date

   has_many :requisite_skills
   has_many :skills, :through => :requisite_skills

   has_many :proposals
   has_many :creatives, :through => :proposals

   belongs_to :buyer

end
