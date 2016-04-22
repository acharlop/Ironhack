class Product < ActiveRecord::Base
	belongs_to :user
	has_many :bids
	validates :title, presence: true
	validates :deadline, presence: true, :timeliness => {:after => lambda {Time.now}, :type => :datetime}
	scope :by_id, ->(id) { find_by(id: id)}


  def active?
  	deadline > Time.now
  end
end
