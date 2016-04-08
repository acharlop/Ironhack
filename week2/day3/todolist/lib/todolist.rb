require 'yaml/store'
require_relative "save_modules.rb"
class ToDoList
	include ToDoStorage
	attr_reader :tasks
	def initialize(username)
		@todo_store = YAML::Store.new("./public/tasks.yml")
		@tasks = []
		@username = username
	end
	def add_task(task)
		@tasks.push(task)
	end
	def find_task_by_id(n)
		tasks.find{|t| t.id == n}
	end
	def delete_task!(n)
		task = find_task_by_id(n)
		@tasks.delete_if{|t| t == task}
	end
	def sort_by_id(order="ASC")
		sorted = sort(:id)
		order == "DESC" ? sorted.reverse : sorted
	end
	def sort_by_created(order="ASC")
		sorted = sort(:created_at)
		order == "DESC" ? sorted.reverse : sorted
	end
	private
	def sort(sort_by)
		@tasks.sort_by{|task| task.send(sort_by)}
	end

end