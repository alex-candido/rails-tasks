# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating Admin Account"

admin = User.new email: "admin@mail.com", first_name: "John", last_name: "Admin"
admin.password = "123456"
admin.password_confirmation = "123456"
admin.admin!

puts "Creating users..."
FactoryBot.create_list :user, 15

puts "Creating Projects"
projects = FactoryBot.create_list :project, 3
projects.each do |project|
  backlog = FactoryBot.create :task_group, title: 'Backlog', position: 1, project: project

  FactoryBot.create_list :task,15, task_group: backlog, project: project

  FactoryBot.create :task_group, title: 'Doing', position: 2, project: project
  FactoryBot.create :task_group, title: 'Done', position: 3, project: project
end
