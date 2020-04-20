require_relative 'base_repository'
require_relative '../models/employee'

class EmployeeRepository < BaseRepository
  def all_delivery_guys
    @elements.select { |element| element.role == 'delivery_guy' }
  end

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end

  undef_method :add

  private

  def csv_read
    csv_options = { col_sep: ',', headers: :first_row, header_converters: :symbol }
    CSV.foreach(@file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @elements << Employee.new(row)
    end
  end

  def csv_write
    CSV.open(@file_path, 'wb') do |csv|
      csv << Employee.headers
      @elements.each { |employee| csv << employee.to_csv_row }
    end
  end
end
