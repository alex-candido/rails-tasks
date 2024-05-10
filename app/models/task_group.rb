# == Schema Information
#
# Table name: task_groups
#
#  id         :integer          not null, primary key
#  position   :integer
#  status     :integer          default("active"), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer          not null
#
# Indexes
#
#  index_task_groups_on_project_id  (project_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#
class TaskGroup < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :project

  enum status: {
    active: 0,
    inactive: 1
  }

  def destroy
    inactive!
  end
end
