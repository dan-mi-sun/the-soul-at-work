class AddProjectIdAndCreativeIdToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :project_id, :integer
    add_column :proposals, :creative_id, :integer
  end
end
