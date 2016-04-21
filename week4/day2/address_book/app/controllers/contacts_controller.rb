class ContactsController < ApplicationController
	def index
		@contacts = Contact.all.order(name: :asc)
	end
	def favorites
		@contacts = Contact.where(favorite: true).order(name: :asc)
		render "index"
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

	def search
		puts "*" * 20
		search = "%" << params[:search] << "%"
		p search
		puts "*" * 20
		p Contact.where("name LIKE :search OR email LIKE :search OR phone LIKE :search OR address LIKE :search", search: search).to_sql
		@contacts = Contact.where("name LIKE :search OR email LIKE :search OR phone LIKE :search OR address LIKE :search", search: search)
		render "index"
	end

	def view
		@contact = Contact.find(params[:id])
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :address, :phone, :email, :avatar)
	end
end
