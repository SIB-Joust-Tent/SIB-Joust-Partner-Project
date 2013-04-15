class AddSocialToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter, :string
    add_column :users, :linkedin, :string
  end
end
