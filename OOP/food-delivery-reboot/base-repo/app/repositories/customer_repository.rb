require "csv"
require_relative "base_repository"
require_relative "../models/customer"

class CustomerRepository < BaseRepository

  private

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      row[:id] = row[:id].to_i
      @elements << Customer.new(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end
end
