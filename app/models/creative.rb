class Creative < User 

  has_many :projects, :through => :skills

end
