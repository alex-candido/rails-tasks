class AddReferencesProjectToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :project, null: false, foreign_key: true
  end
end
