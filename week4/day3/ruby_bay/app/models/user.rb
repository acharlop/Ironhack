class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true, format: { with: /@/ }
	validates :name, presence: true
end
