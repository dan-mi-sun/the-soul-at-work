class RemoveNameFromProposals < ActiveRecord::Migration
  def change
    remove_column :proposals, :name, :string
  end
end
