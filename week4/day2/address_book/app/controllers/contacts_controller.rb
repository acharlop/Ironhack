class ContactsController < ApplicationController
	def index
		@contacts = Contact.all.order(name: :asc)
	end
	def new
		@contact = Contact.new
	end
end
