# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  status     :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :task_groups, dependent: :destroy

  enum status: {
    active: 0,
    inactive: 1
  }

  def destroy
    inactive!
  end
end
