require "csv"
require_relative "base_repository"
require_relative "../models/order"

class OrderRepository < BaseRepository
  def initialize(csv_file, attr={})
    # Go through the trouble of debugging this if these were flipped
    @meal_repository = attr[:meal_repo]
    @customer_repository = attr[:customer_repo]
    @employee_repository = attr[:employee_repo]
    super(csv_file)
  end

  def undelivered_orders
    @elements.reject { |order| order.delivered? }
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  def my_undelivered_orders(employee)
    @elements.select { |order| order.employee == employee && !order.delivered? }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      @elements << Order.new(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

end
