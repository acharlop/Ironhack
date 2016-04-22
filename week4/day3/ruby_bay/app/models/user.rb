class User < ActiveRecord::Base
	has_many :products
	has_many :bids
	validates :email, presence: true, uniqueness: true, format: { with: /@/ }
	validates :name, presence: true
	validates :password, presence: true
	scope :by_id, ->(id) { find_by(id: id)}

	def self.authenticate(params)
		user = User.find_by(email: params[:email])
		if !user.nil? && user.password == params[:password]
			user
		else
			false
		end
	end
end
