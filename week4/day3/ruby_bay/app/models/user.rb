class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true, format: { with: /@/ }
	validates :name, presence: true
	scope :by_id, ->(id) { find_by(id: id)}
end
