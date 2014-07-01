class AddSkillIdAndUserIdToExpertise < ActiveRecord::Migration
  def change
    add_column :expertises, :skill_id, :integer
    add_column :expertises, :user_id, :integer
  end
end
