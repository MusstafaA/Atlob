class Ordetail < ActiveRecord::Base
  belongs_to :user
  delegate :name, :to => :user, :prefix => true

  validates :item, presence: true ,format:{with: /[a-zA-z]/, message: ' item can only have letters ' }
  validates :price, presence: true ,:numericality => { :greater_than_or_equal_to => 0 },inclusion: { in: 0..5 }
  validates :amount, presence: true , format:{with: /\A[+]?\d+\z/, message: ' item can only have postive numbers ' }
end
