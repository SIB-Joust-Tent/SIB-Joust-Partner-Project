class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :tagline
      t.string :location
      t.string :facebookhandle
      t.string :twitterhandle
      t.string :rssfeed
      t.string :description
      t.string :url
      t.string :image

      t.timestamps
    end
  end
end
