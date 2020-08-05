require "csv"
require_relative "base_repository"
require_relative "../models/order"

class OrderRepository < BaseRepository
  def initialize(csv_file, attr={})
    # We deliver our repos that the order repository needs access to in a hash
    # The order repository needs access to all other repos because it needs a way to deserialize from id to instance in the load csv method
    @meal_repository = attr[:meal_repo]
    @customer_repository = attr[:customer_repo]
    @employee_repository = attr[:employee_repo]
    # This super here calls the initialize method in the Base Repository class.  Remember that initialize method only takes one argument, the csv file
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
    # The condition we select on here is if the order is associated to the employee as well as if it has NOT been delivered
    @elements.select { |order| order.employee == employee && !order.delivered? }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      # This is the trickiest portion of this code.  It is here that we go through the process of deserialization where we convert from strings we get from our csv into actual data types we want (integers, booleans) and instances of objects that correspond to the ids given to us
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      @elements << Order.new(row)
    end
    # Sets the new id based off the last element IF there are elements in the csv file, otherwise this stays as 1 from when we set it in our initialize
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

end
