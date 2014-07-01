class AddAboutLocationLanguagesSkillsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :languages, :string
    add_column :users, :skills, :text
  end
end
