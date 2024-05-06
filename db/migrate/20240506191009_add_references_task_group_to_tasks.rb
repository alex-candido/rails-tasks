class AddReferencesTaskGroupToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :task_group, null: false, foreign_key: true
  end
end
