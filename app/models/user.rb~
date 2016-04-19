class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   mount_uploader :avatar, AvatarUploader
   
   validates :name, presence: true,length: { minimum: 6 }  ,uniqueness: true
   validates :avatar, presence: true

end
