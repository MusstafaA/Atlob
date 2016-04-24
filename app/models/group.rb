class Group < ActiveRecord::Base
  belongs_to :user

  
  has_many :usgroups, :dependent => :destroy  
  has_many :users, :through => :usgroups

 
end
