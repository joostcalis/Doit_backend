class AddDefaultToProject < ActiveRecord::Migration
  def change
    change_column :projects, :finished, :boolean, :default => false
  end
end
