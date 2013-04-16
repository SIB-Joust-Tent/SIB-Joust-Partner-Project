require 'open-uri'
require 'json'

class Company < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :description, :facebookhandle, :image, :image_cache, :remove_image, 
                  :location, :name, :rssfeed, :tagline, :twitterhandle, :url, 
                  :displayed_trello_lists

  serialize :displayed_trello_lists

  mount_uploader :image, AvatarUploader

  has_many :users

  def displayed_trello_lists_enum
  	public_key = ENV['TRELLO_PUBLIC_KEY']
		token = ENV['TRELLO_TOKEN']

		uri =  JSON.parse(URI.parse("https://api.trello.com/1/boards/511c01ca8f642cbd1c0053b5?fields=closed&lists=open&list_fields=name&key=#{public_key}&token=#{token}").open.read)
		lists = uri.assoc("lists")
		lists[1].map{|l| [l["name"], l["id"]] }
  end

end
