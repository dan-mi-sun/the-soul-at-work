class Skill < ActiveRecord::Base

  has_many :expertise
  has_many :users, :through => :expertise

end
