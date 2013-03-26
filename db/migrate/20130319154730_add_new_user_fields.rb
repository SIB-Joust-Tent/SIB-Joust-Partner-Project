class AddNewUserFields < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string, null: false, :default => ""
  	add_column :users, :position, :string
  	add_column :users, :avatar, :string
  end
end
