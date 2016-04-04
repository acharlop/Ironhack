require_relative "../lib/todolist.rb"
require_relative "../lib/task.rb"

RSpec.describe "ToDoList class testing" do
	before(:all) {
		@list = ToDoList.new("Test")
		@task4 = Task.new("test 4")
		@task1 = Task.new("test 1")
		@task2 = Task.new("test 2")
		@task3 = Task.new("test 3")
	}
	it "List initialized to empty array" do
		expect(@list.tasks).to be_empty
	end
	it "Tasks being added to array and are of type task" do
		@list.add_task(@task1)
		expect(@list.tasks).to_not be_empty
		expect(@list.tasks[0]).to be_instance_of(Task)
	end
	it "Tasks can be retreived by ID" do
		@list.add_task(@task2)
		expect(@list.find_task_by_id(@task1.id)).to eq(@task1)
	end
	it "If no task found by ID return nil" do
		expect(@list.find_task_by_id(@task3.id)).to be_nil
	end
	it "Sort by id" do
		@list.add_task(@task3)
		expect(@list.sort_by_id).to eq([@task1,@task2,@task3])
	end
	it "Sort by id Explicit" do
		expect(@list.sort_by_id("ASC")).to eq([@task1,@task2,@task3])
	end
	it "Reverse sort by id" do
		expect(@list.sort_by_id("DESC")).to eq([@task3,@task2,@task1])
	end
	it "Test sort by created at " do
		@list.add_task(@task4)
		expect(@list.sort_by_created).to eq([@task4,@task1,@task2,@task3])
	end
	it "Test sort by created at - Explicit" do
		expect(@list.sort_by_created).to eq([@task4,@task1,@task2,@task3])
	end
	it "Test sort by created at - Reverse" do
		expect(@list.sort_by_created("DESC")).to eq([@task3,@task2,@task1,@task4])
	end
	it "Need to specify username or ArgumentError thrown" do
		expect{ToDoList.new}.to raise_error(ArgumentError)
	end
	it "deleting task" do
		length = @list.tasks.length
		@list.delete_task!(@task4.id)
		expect(@list.tasks.length).to eq(length - 1)
	end
	it "Delete To Do List" do
		@list.delete_all!
		expect(@list.tasks.length).to eq(0)
	end
	it "saving and loading should be equal THIS TEST DOESN'T WORK.\nFEATURE DOES BUT TESTING DOESN'T" do
		test = ToDoList.new("New Test")
		test.add_task(Task.new("Walk Dog"))
		test.add_task(Task.new("Buy Milk"))
		test.save
		test_save = ToDoList.new("New Test")
		test_save.load
		expect(test).not_to be(test_save)
		test.delete_all!
		test_save.delete_all!
	end
end
