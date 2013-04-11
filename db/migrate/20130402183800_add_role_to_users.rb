class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    c = Company.find("joust")
    c.users.each do |u|
      u.role = "admin"
      u.save!
    end
  end
end
