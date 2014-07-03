class CreateRequisiteSkills < ActiveRecord::Migration
  def change
    create_table :requisite_skills do |t|

      t.timestamps
    end
  end
end
