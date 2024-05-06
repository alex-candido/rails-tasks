class CreateTaskGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :task_groups do |t|
      t.string :title, null: false
      t.integer :position
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
