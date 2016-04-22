class Product < ActiveRecord::Base
	belongs_to :user
	has_many :bids
	validates :title, presence: true
	validates :deadline, presence: true, :timeliness => {:after => lambda {Time.now}, :type => :datetime}
	before_validation :default_price, :on => :create
	scope :by_id, ->(id) { find_by(id: id)}


  def active?
  	deadline > Time.now
  end

  def winner
  	bids.last.user
  end

  private
  def default_price
  	self.price = 0 if self.price.blank?
  end
end
