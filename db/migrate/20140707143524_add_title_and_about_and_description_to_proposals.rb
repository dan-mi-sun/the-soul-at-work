class AddTitleAndAboutAndDescriptionToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :title, :string
    add_column :proposals, :description, :text
    add_column :proposals, :about, :text
  end
end
