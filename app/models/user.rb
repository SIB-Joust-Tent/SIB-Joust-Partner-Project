class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :name, :position, :image, :image_cache, :remove_image, :linkedin, :twitter


  belongs_to :company

  mount_uploader :image, AvatarUploader

  def is?(test_role)
    role && role == test_role.to_s
  end

  def role_enum
    ['admin', 'employee', 'investor']
  end

end
