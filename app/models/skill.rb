class Skill < ActiveRecord::Base

  has_many :expertise
  has_many :users, :through => :expertise

  has_many :requisite_skills
  has_many :projects, :through => :requisite_skills

end
