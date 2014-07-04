class AddBuyerIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :buyer_id, :integer
  end
end
