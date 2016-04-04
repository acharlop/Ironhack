class ToDoList
	attr_reader :tasks
	def initialize
		@tasks = []
	end
	def add_task(task)
		@tasks.push(task)
	end
	def find_task_by_id(n)
		tasks.find{|t| t.id == n}
	end
end