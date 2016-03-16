class CreateProjectChecklists < ActiveRecord::Migration
  def change
    create_table :project_checklists do |t|
      t.integer :project_id
      t.integer :checklist_id
      t.boolean :status

      t.timestamps null: false
    end
  end
end
