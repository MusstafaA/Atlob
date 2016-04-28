class Ordetail < ActiveRecord::Base
  belongs_to :user
  delegate :name, :to => :user, :prefix => true

  validates :item, presence: true ,format:{with: /[a-zA-z]/, message: ' item can only have letters ' }
  validates :price, presence: true 
  validates :amount, presence: true 
end
