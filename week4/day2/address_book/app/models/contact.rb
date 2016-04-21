class Contact < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/contact-icon.svg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


	validates :name, presence: true
	validates :address, presence: true
	validates_format_of :email, :with => /@/
	# validates :phone, presence: true, if: :phone_valid?

	def phone_valid?
		phony_phone = PhonyRails.normalize_number phone, as: :phone_number_normalized, default_country_code: 'US'
		if PhonyRails.plausible_number? phony_phone
			self.phone = phony_phone.phony_formatted
		else
			false
		end
	end

end
