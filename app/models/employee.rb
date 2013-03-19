class Employee < ActiveRecord::Base
  # attr_accessible :title, :body
  	attr_accessible :name, :position, :avatar
  	
	belongs_to :company

  	mount_uploader :avatar, AvatarUploader
end
