# frozen_string_literal: true

class Order
  attr_reader :meal, :employee, :customer
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered]
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @customer = attributes[:customer]
  end

  def delivered?
    @delivered || false
  end

  def deliver!
    @delivered = true
  end

  # useful in the repository to cleanly give values to a row
  def to_csv_row
    [@id, delivered?, @meal.id, @employee.id, @customer.id]
  end

  # method to print information about orders, used in views
  def pretty_print
    puts "I'm about to return myself"
    self
  end

  # useful for cleaning up the csv methods in repos
  def self.headers
    %w[id delivered meal_id employee_id customer_id]
  end
end
