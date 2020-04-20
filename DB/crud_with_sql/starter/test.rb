require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"

# Read Tests

task = Task.find(1)
puts "#{task.title} - #{task.description}"
