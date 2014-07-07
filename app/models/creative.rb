class Creative < User 

  has_many :projects, :through => :skills

  def relevant_projects
    projects = Project.all
    projects.each do |project| 
    project.skills.where(:id => self.skills.first.id)
    end
  end

end
