class AddDescriptionToProjectChecklists < ActiveRecord::Migration
  def change
    add_column :project_checklists, :description, :text
    remove_column :checklists, :status, :boolean
    remove_column :checklists, :project_id, :int
    remove_column :checklists, :description_id, :int
  end
end
