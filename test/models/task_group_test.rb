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
require "test_helper"

class TaskGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
