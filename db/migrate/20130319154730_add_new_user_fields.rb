class AddNewUserFields < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string, null: false
  	add_column :users, :position, :string, null: false
  	add_column :users, :avatar, :string
  end
end
