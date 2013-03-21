class Company < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :description, :facebookhandle, :image, :location, :name, :rssfeed, 
  				  			:tagline, :twitterhandle, :url

  has_many :users
end
