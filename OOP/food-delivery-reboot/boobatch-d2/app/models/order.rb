class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attr={})
    @id = attr[:id]
    @meal = attr[:meal]
    @customer = attr[:customer]
    @employee = attr[:employee]
    @delivered = attr[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def delivered!
    @delivered = true
  end

  def to_array
    [@id, @delivered, @meal.id, @customer.id, @employee.id]
  end

  def self.csv_headers
    %w[id delivered meal_id customer_id employee_id]
  end

  def to_s
    "#{@employee.username.capitalize} must deliver #{@meal.name} to #{@customer.name} in #{@customer.address}"
  end
end
