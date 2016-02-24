class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :body
      t.boolean :finished
      t.date :end_date

      t.timestamps null: false
    end
  end
end
