require_relative "../lib/todolist.rb"
require_relative "../lib/task.rb"

RSpec.describe "ToDoList class testing" do
	let(:list) {ToDoList.new}
	it "List initialized to empty array" do
		expect(list.tasks).to be_empty
	end
	it "Tasks being added to array and are of type task" do
		list.add_task(Task.new("Testing"))
		expect(list.tasks).to_not be_empty
		expect(list.tasks[0]).to be_instance_of(Task)
	end
	it "Tasks can be retreived by ID" do
		task1 = Task.new("test 1")
		task2 = Task.new("test 2")
		list.add_task(task1)
		list.add_task(task2)
		expect(list.find_task_by_id(task1.id)).to eq(task1)
	end
	it "If no task found by ID return nil" do
		expect(list.find_task_by_id(3)).to be_nil
	end
end
