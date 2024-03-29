require "csv"
require_relative "base_repository"
require_relative "../models/order"
require 'pry-byebug'

class OrderRepository < BaseRepository
  def initialize(csv_file, repos = {})
    @meal_repository = repos[:meal_repo]
    @customer_repository = repos[:customer_repo]
    @employee_repository = repos[:employee_repo]
    super(csv_file)
  end

  def undelivered_orders
    @elements.reject do |element|
      element.delivered?
    end
  end

  private

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      binding.pry
      row[:id] = row[:id].to_i
      row[:delivered] = (row[:delivered] == "true")
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      @elements << Order.new(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end
end
