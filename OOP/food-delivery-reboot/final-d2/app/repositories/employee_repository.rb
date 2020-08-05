require "csv"
require_relative "base_repository"
require_relative "../models/employee"


class EmployeeRepository < BaseRepository

  # These two methods are needed by the employee repository and extend the base repository class
  def all_delivery_guys
    @elements.select { |element| element.delivery_guy? }
  end

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end

  undef create

  private

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      row[:id] = row[:id].to_i
      @elements << Employee.new(row)
    end
  end
end
