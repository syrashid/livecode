require_relative '../views/orders_view'

class OrdersController
  def initialize(orders_repository)
    @orders_repository = orders_repository
    @orders_view = OrdersView.new
  end

  def list_undelivered_orders
    # Retrieve the undelivered orders
    undelivered_orders = @orders_repository.undelivered_orders
    # Display the order with our view
    @orders_view.display(undelivered_orders)
  end
end
