require "sqlite3"
require "pry"

class Task
  attr_reader :id
  attr_accessor :title, :description, :done
  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || 0
  end

  def self.find(id)
    data = DB.execute('select * from tasks where id = ?', id).first
    data ? Task.new(data.transform_keys(&:to_sym)) : nil
  end

  def self.all
    data = DB.execute('select * from tasks')
    tasks = []
    data.each do |row|
      tasks << Task.new(row.transform_keys(&:to_sym))
    end
    tasks
  end

  def save
    if @id
      DB.execute('update tasks set title = ?, description = ?, done = ? where id = ?', @title, @description, @done, @id)
    else
      DB.execute('insert into tasks (title, description, done) values (?, ?, ?)', @title, @description, @done)
      @id = DB.last_insert_row_id
    end
  end

  def destroy
    DB.execute('delete from tasks where id = ?', @id)
  end
end
