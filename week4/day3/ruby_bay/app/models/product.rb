class Product < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :deadline, presence: true, :timeliness => {:after => lambda {Time.now}, :type => :datetime}
	scope :by_id, ->(id) { find_by(id: id)}
end
