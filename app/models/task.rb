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
#  task_group_id :integer          not null
#
# Indexes
#
#  index_tasks_on_task_group_id  (task_group_id)
#
# Foreign Keys
#
#  task_group_id  (task_group_id => task_groups.id)
#
class Task < ApplicationRecord
  enum status: {
    pending: 0,
    completed: 1,
    archived: 2
  }

  belongs_to :task_group

  def destroy
    archived!
  end
end
