# frozen_string_literal: true

require_relative '../models/customer'
require_relative '../views/customers_view'

class CustomersController
  def initialize(repository)
    @repository = repository
    @view = CustomerView.new
  end

  def list
    customers = @repository.all
    @view.display(customers)
  end

  def add
    # Talk about how this compares to meals_controller, how we've abstracted here
    customer = Customer.new(@view.ask_for_info)
    @repository.add(customer)
  end

  def delete
    id = @view.ask_for_id
    @repository.destroy(id)
  end
end
