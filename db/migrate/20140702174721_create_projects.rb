class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :about
      t.date :closing_date

      t.timestamps
    end
  end
end
