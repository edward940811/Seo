class AddProgressToProject < ActiveRecord::Migration
  def change
    add_column :projects, :progress, :integer
    add_column :projects, :totalchecklist, :integer
  end
end
