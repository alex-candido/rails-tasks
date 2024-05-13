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
FactoryBot.define do
  factory :task_group do
    title { nil }
    position { nil }
    project { nil }
  end
end
