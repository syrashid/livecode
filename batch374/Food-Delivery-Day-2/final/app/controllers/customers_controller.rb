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
    # Compare this to meals controller, look at how much we've abstracted to the view.  Remember skinny controllers are key
    customer = Customer.new(@view.ask_for_info)
    @repository.add(customer)
  end

  def delete
    id = @view.ask_for_id
    @repository.destroy(id)
  end
end
