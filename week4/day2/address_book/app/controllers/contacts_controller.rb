class ContactsController < ApplicationController
	def index
		@contacts = Contact.all.order(name: :asc)
	end
end
