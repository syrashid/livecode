require "sqlite3"
DB = SQLite3::Database.new("./tasks.db")
DB.results_as_hash = true
require_relative "task"

# Read Tests
# Should read "Complete Livecode - Implement CRUD on Task" if it exists, nil otherwise
read_task = Task.find(2)
puts "#{read_task == nil ? "This was great!" : "This failed"}"

read_task = Task.find(1)
puts "#{read_task.title} - #{read_task.description}"


# Create Tests
create_task = Task.new(title: "Create task title", description: "create task description")
create_task.save
puts "The new task id is #{create_task.id} and should not be nil"


# Update Task Test
create_task.title = "Brand spanking new title"
create_task.save
puts create_task.title
puts "the above should say brand spanking new title"


# Read all the tasks
tasks = Task.all
tasks.each do |task|
  puts "#{task.done == 0 ? '[ ]' : '[X]'} #{task.id} #{task.title}"
end

# Destroy a task
destroy_task = Task.find(1)
destroy_task.destroy


tasks = Task.all
tasks.each do |task|
  puts "#{task.done == 0 ? '[ ]' : '[X]'} #{task.id} #{task.title}"
end
