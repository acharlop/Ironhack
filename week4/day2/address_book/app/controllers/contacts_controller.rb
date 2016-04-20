class ContactsController < ApplicationController
	def index
		@contacts = Contact.all.order(name: :asc)
	end
	def favorites
		@contacts = Contact.where(favorite: true).order(name: :asc)
	end
	def new
		@contact = Contact.new
	end
	def create
		new_contact = Contact.new(contact_params)
		if new_contact.phone_valid? && new_contact.save
			redirect_to :action => "index"
		else
			render plain: "nope"
		end
	end


	def view
		@contact = Contact.find(params[:id])
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :address, :phone, :email)
	end
end
