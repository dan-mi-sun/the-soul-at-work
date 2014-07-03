class AddSkillIdAndProjectIdToRequisiteSkills < ActiveRecord::Migration
  def change
    add_column :requisite_skills, :skill_id, :integer
    add_column :requisite_skills, :project_id, :integer
  end
end
