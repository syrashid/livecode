require 'sqlite3'
DB = SQLite3::Database.new('tasks.db')
DB.results_as_hash = true
require_relative 'task'

# Read Tests

# For One (What are all the cases here)
# When the record exists
f1_task = Task.find(1)
f1_task ? (puts "#{f1_task.title} - #{f1_task.description}") : (puts "No Task Found")
# When the record does not exist
f1_task = Task.find(100)
f1_task ? (puts "#{f1_task.title} - #{f1_task.description}") : (puts "No Task Found")

# For Many Tasks (all method)
fa_tasks = Task.all
fa_tasks.each do |task|
  puts "#{task.done? ? '[x]' : '[ ]'} #{task.id} #{task.title}"
end

# Create Test
c_task = Task.new(title: 'Create task title', description: 'Create task description')
c_task.save
puts "The new created task id is #{c_task.id} and title is #{c_task.title}"

# Update Test
c_task.title = 'Brand Spanking New Title'
c_task.done = 1
c_task.save
puts "The new created task id is #{c_task.id} and title is #{c_task.title}"
puts "#{c_task.done? ? "[x]" : "[ ]"} #{c_task.title}"

# Destroy Test
d_task = Task.find(13)
d_task.destroy
d_task = Task.find(13)
# Should return no task found
f1_task ? (puts "#{f1_task.title} - #{f1_task.description}") : (puts "No Task Found")
