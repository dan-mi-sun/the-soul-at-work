class AddBalancedCardUriToUsers < ActiveRecord::Migration
  def change
    add_column :users, :balanced_card_uri, :string
  end
end
