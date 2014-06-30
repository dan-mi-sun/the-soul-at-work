class CreateCreatives < ActiveRecord::Migration
  def change
    create_table :creatives do |t|

      t.timestamps
    end
  end
end
