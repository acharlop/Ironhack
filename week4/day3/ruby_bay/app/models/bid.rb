class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  accepts_nested_attributes_for :user
  
  validates :amount, presence: true
end
