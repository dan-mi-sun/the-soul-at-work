class RemoveSkillsAndLanguagesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :languages, :string
    remove_column :users, :skills, :text
  end
end
