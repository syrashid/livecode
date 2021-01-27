require 'csv'
require_relative './base_repository'

class OrderRepository < BaseRepository
  def initialize(csv_file, attributes = {})
    @meal_repository = attributes[:meal_repository]
    @customer_repository = attributes[:customer_repository]
    @employee_repository = attributes[:employee_repository]

    super(csv_file)
  end

  def undelivered_orders
    @elements.reject { |element| element.delivered? }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      # DESERIALIZE
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      @elements << Order.new(row)
    end

    @next_id = @elements.last.id + 1 unless @elements.empty?
  end
end
