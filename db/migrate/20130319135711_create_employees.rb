class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employee do |t|
    	t.string	:name
    	t.string	:position
    	t.string	:avatar
      t.timestamps
    end
  end
end
