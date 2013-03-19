class AddCompanyIndextoUser < ActiveRecord::Migration
  def change
  	add_index :users, :company_id
  end
end
