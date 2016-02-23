class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.boolean :finished, default: false
      t.date :end_date

      t.timestamps null: false
    end
  end
end
