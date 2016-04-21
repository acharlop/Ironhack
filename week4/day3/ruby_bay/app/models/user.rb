class User < ActiveRecord::Base
	has_many :products
	has_many :bids
	validates :email, presence: true, uniqueness: true, format: { with: /@/ }
	validates :name, presence: true
	scope :by_id, ->(id) { find_by(id: id)}
end
