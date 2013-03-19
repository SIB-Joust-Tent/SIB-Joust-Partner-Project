class Company < ActiveRecord::Base
  attr_accessible :description, :facebookhandle, :image, :location, :name, :rssfeed, 
  				  			:tagline, :twitterhandle, :url

  has_many :users
end
