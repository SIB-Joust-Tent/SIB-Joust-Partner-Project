class ChangeAvatarToImage < ActiveRecord::Migration
  def change
    rename_column :users, :avatar, :image
  end
end
