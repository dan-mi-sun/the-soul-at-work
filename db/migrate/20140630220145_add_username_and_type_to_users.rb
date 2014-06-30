class AddUsernameAndTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :type, :string
  end
end
