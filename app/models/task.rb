# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  description   :text
#  status        :integer          default("pending"), not null
#  title         :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  project_id    :integer          not null
#  task_group_id :integer          not null
#
# Indexes
#
#  index_tasks_on_project_id     (project_id)
#  index_tasks_on_task_group_id  (task_group_id)
#
# Foreign Keys
#
#  project_id     (project_id => projects.id)
#  task_group_id  (task_group_id => task_groups.id)
#
class Task < ApplicationRecord
  belongs_to :task_group
  belongs_to :project

  enum status: {
    pending: 0,
    completed: 1,
    archived: 2
  }

  def destroy
    archived!
  end
end
