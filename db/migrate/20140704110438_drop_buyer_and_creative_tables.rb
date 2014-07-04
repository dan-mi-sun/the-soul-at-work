class DropBuyerAndCreativeTables < ActiveRecord::Migration
  def change
    drop_table :creatives
    drop_table :buyers
  end
end
