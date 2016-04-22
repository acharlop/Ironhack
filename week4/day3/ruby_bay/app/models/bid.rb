class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :amount, presence: true
  validates :user, presence: true
  validates :product, presence: true
  
  validate :greater_than_price
  after_create :update_product_price


 	private

 	def greater_than_price
 		if self.product.price > self.amount
 			errors.add(:amount, "must be greater than highest bid")
 		end
 	end

 	def update_product_price
 		self.product.price = self.amount
 	end
end
