module ToDoStorage
	def save 
		@todo_store.transaction do
			@todo_store[@username] = @tasks
		end
	end
	def load
		@todo_store.transaction do
			@tasks = @todo_store[@username]
		end
	end
	def delete_all!
		@todo_store.transaction do
			@todo_store[@username] = nil
		end
		@tasks = []
	end
end