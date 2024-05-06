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
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
