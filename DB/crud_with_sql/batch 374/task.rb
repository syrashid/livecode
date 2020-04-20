require 'pry'
class Task
  attr_reader :id
  attr_accessor :title, :description
  attr_writer :done
  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done]
  end

  def self.find(id)
    data = DB.execute("SELECT * FROM tasks WHERE id = ?", id).first
    data ? Task.new(data.transform_keys(&:to_sym)) : nil
    # if data
    #   Task.new(data.transform_keys(&:to_sym))
    # else
    #   nil
    # end
  end

  def self.all
    sql_query = "SELECT * FROM tasks"
    data = DB.execute(sql_query)
    data.collect { |node| Task.new(node.transform_keys(&:to_sym)) }
  end

  def save
    if @id
      sql_query = 'UPDATE tasks SET title = ?, description = ?, done = ?'
      DB.execute(sql_query, @title, @description, @done)
    else
      sql_query = 'INSERT INTO tasks (title, description, done) VALUES (?,?,?)'
      DB.execute(sql_query, @title, @description, 0)
      @id = DB.last_insert_row_id
    end
  end

  def destroy
    sql_query = 'DELETE FROM tasks WHERE id = ?'
    DB.execute(sql_query, @id)
  end

  def done?
    @done == 1
  end
end
