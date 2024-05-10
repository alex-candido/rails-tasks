class AddExtraColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :phone, :string
    add_column :users, :role, :integer, null: false, default: 1
    add_column :users, :gender, :integer, null: true
    add_column :users, :social_media, :jsonb, default: {}
  end
end
