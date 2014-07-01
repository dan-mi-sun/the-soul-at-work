class AddUserIdAndLanguageIdToUserLanguages < ActiveRecord::Migration
  def change
    add_column :user_languages, :user_id, :integer
    add_column :user_languages, :language_id, :integer
  end
end
