require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"
require 'pry'




# Read Tests

task = Task.find(1)

puts "#{task.title} - #{task.description}"
task = Task.find(100)
puts task.nil?


# Update Test
s_task = Task.find(1)
s_task.title = "Complete Save Task in Livecode"
s_task.save

updated_task = Task.find(1)
puts "#{updated_task.title} - #{updated_task.description}"

# Create Test
new_task = Task.new(title: "DO THIS ASAP", description: "Have a great weekend!")
new_task.save
puts " #{new_task.id}. #{new_task.title} - #{new_task.description}"

# Read All Test
puts Task.all

# Destroy task
d_task = Task.find(1)
d_task.destroy
puts Task.find(1).nil?
