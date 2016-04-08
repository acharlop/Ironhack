class Task
	attr_reader :content, :id, :created_at, :updated_at
	@@current_id = 1
	def initialize(content)
		@content = content
		@id = @@current_id
		@@current_id += 1
		@completed = false
		@created_at = Time.now
		@updated_at = nil
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
		@updated_at = Time.now
	end
	def attrs
    instance_variables.map{|ivar| instance_variable_get ivar}
  end
end