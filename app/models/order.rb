class Order < ActiveRecord::Base
  belongs_to :user

  has_many :ordetails,  :dependent => :destroy   
  has_many :users, :through => :ordetails  
  
  has_many :inviteds,  :dependent => :destroy  
  has_many :users, :through => :inviteds

  mount_uploader :avatar, AvatarUploader
end
