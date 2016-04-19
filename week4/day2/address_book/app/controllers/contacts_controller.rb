class ContactsController < ApplicationController
	def index
		@contacts = Contact.all.order(name: :asc)
	end
	def new
		@contact = Contact.new
	end
	def create
		new_contact = Contact.create(contact_params)
		redirect_to :action => "index"
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :address, :phone, :email)
	end
end
