class Task
	attr_reader :content, :id, :created_at
	@@current_id = 1
	def initialize(content)
		@content = content
		@id = @@current_id
		@@current_id += 1
		@completed = false
		@created_at = Time.now
	end
	def complete?
		@completed
	end
	def complete!
		@completed = true
	end
	def undo_complete!
		@completed = false
	end
	def update_content(content)
		@content = content
	end
end