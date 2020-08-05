require "csv"
require_relative "base_repository"
require_relative "../models/employee"

class EmployeeRepository < BaseRepository
  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      row[:id] = row[:id].to_i
      @elements << Employee.new(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end
end
