# frozen_string_literal: true
require 'pry'

class OrderRepository
  def initialize(csv_path, meal_repository, employee_repository, customer_repository)
    @csv_path = csv_path
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository

    @orders = []

    load_csv if File.exist?(@csv_path)
  end

  def add(order)
    order.id = @orders.empty? ? 1 : @orders.last.id + 1
    @orders << order
    write_csv
  end

  def undelivered_orders
    @orders.reject(&:delivered?)
  end

  # we keep this special method to save to csv after we mark an order as completed
  def save
    write_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      order = build_order(row)
      @orders << order
    end
  end

  def write_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << Order.headers
      @orders.each do |order|
        csv << order.to_csv_row
      end
    end
  end

  def build_order(row)
    row[:id] = row[:id].to_i # Convert column to Integer
    row[:delivered] = row[:delivered] == 'true'
    row[:meal] = @meal_repository.find(row[:meal_id].to_i)
    row[:employee] = @employee_repository.find(row[:employee_id].to_i)
    row[:customer] = @customer_repository.find(row[:customer_id].to_i)
    Order.new(row)
  end
end
