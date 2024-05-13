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
require "faker"

FactoryBot.define do
  factory :project do
    title { Faker::Lorem.sentence }
  end
end
