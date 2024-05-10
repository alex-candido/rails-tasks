class AddReferencesProjectToTaskGroups < ActiveRecord::Migration[7.1]
  def change
    add_reference :task_groups, :project, null: false, foreign_key: true
  end
end
