# frozen_string_literal: true

require 'csv'
require_relative '../models/customer'
require_relative 'base_repository'

class CustomerRepository < BaseRepository
  private

  def csv_read
    csv_options = { col_sep: ',', headers: :first_row, header_converters: :symbol }
    CSV.foreach(@file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @elements << Customer.new(row)
    end
  end

  def csv_write
    csv_options = { col_sep: ',' }
    CSV.open(@file_path, 'wb', csv_options) do |csv|
      csv << %w[id name address]
      @elements.each { |element| csv << [element.id, element.name, element.address] }
    end
  end
end
