class AddSlugToTables < ActiveRecord::Migration
  def change
    add_column :companies, :slug, :string
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
    add_index :companies, :slug, unique: true
    User.find_each(&:save)
    Company.find_each(&:save)
  end
end
