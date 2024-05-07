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
#
class TaskGroup < ApplicationRecord
  has_many :tasks, dependent: :destroy

  enum status: {
    active: 0,
    inactive: 1
  }

  has_many :tasks, dependent: :destroy

  def destroy
    inactive!
  end
end
