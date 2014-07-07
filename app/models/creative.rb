class Creative < User 

  has_many :projects, :through => :skills

  has_many :proposals
  has_many :pitches, :class_name => "Project", :through => :proposals

end
