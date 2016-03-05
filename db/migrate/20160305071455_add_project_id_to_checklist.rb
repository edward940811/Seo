class AddProjectIdToChecklist < ActiveRecord::Migration
  def change
    add_column :checklists , :project_id , :integer
  end
end
