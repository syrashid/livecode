# frozen_string_literal: true

class BaseRepository
  def initialize(file_path)
    @file_path = file_path
    @elements = []
    #  Quick check to validate file path given is valid and exists
    csv_read if File.exist?(file_path)
  end

  def all
    @elements
  end

  def add(element)
    # Easy way to determine the "next" id needed
    element.id = @elements.empty? ? 1 : @elements.last.id + 1
    @elements << element
    csv_write
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  # helpful method if we want to implement destory user stories
  def destroy(id)
    @elements.delete(find(id))
    csv_write
  end
end
