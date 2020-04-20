require "sqlite3"
require 'pry'

class Task
  attr_accessor :title, :description
  attr_writer :done
  attr_reader :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || 0
  end

  def self.find(id)
    data = DB.execute('SELECT * FROM tasks where id = ?', id).first
    data ? Task.new(data.transform_keys(&:to_sym)) : data
  end

  def self.all
    data = DB.execute('SELECT * FROM tasks')
    data.collect { |node| Task.new(node.transform_keys(&:to_sym)) }
  end

  def save
    if @id
      sql_query = 'UPDATE tasks SET title = ?, description = ?, done = ? WHERE id = ?'
      DB.execute(sql_query, @title, @description, @done, @id)
    else
      sql_query = 'INSERT INTO tasks (title, description, done) VALUES (?,?,?)'
      DB.execute(sql_query, @title, @description, @done)
      @id = DB.last_insert_row_id
    end
  end

  def done?
    @done == 1
  end

  def destroy
    DB.execute('DELETE FROM tasks WHERE id = ?', @id)
  end
end
