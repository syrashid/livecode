# frozen_string_literal: true

class BaseRepository
  def initialize(file_path)
    @file_path = file_path
    @elements = []
    # Talk about this
    csv_read if File.exist?(file_path)
  end

  def all
    @elements
  end

  def add(element)
    # Talk about finding the next id
    element.id = @elements.empty? ? 1 : @elements.last.id + 1
    @elements << element
    csv_write
  end

  def find(id)
    # Talk about the find method here
    @elements.find { |element| element.id == id }
  end

  def destroy(id)
    @elements.delete(find(id))
    csv_write
  end
end
