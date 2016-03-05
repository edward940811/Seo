class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :title
      t.text :description
      t.boolean :status
      t.integer :description_id

      t.timestamps null: false
    end
  end
end
