require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/sessions_view"
require_relative "../views/orders_view"
require 'pry-byebug'

class OrdersController
  def initialize(attr={})
    @meal_repo = attr[:meal_repo]
    @customer_repo = attr[:customer_repo]
    @employee_repo = attr[:employee_repo]
    @order_repo = attr[:order_repo]
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
    @orders_view = OrdersView.new
  end

  def add
    meal = select_meal
    customer = select_customer
    employee = select_employee
    binding.pry
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repo.create(order)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repo.undelivered_orders
    @orders_view.display(undelivered_orders)
  end

  def list_my_orders(current_user)
    list_my_undelivered_orders(current_user)
  end

  def mark_as_delivered(current_user)
    list_my_undelivered_orders(current_user)
    index = @orders_view.ask_user_for_index
    my_orders = @order_repo.my_undelivered_orders(current_user)
    order = my_orders[index]
    @order_repo.mark_as_delivered(order)
  end

  private

  def select_meal
    @orders_view.prompt_for("meal")
    meals = @meal_repo.all
    @meals_view.display(meals)
    index = @orders_view.ask_user_for_index
    return meals[index]
  end

  def select_customer
    @orders_view.prompt_for("customer")
    customers = @customer_repo.all
    @customers_view.display(customers)
    index = @orders_view.ask_user_for_index
    return customers[index]
  end

  def select_employee
    @orders_view.prompt_for("employee")
    employees = @employee_repo.all_delivery_guys
    @sessions_view.display(employees)
    index = @orders_view.ask_user_for_index
    return employees[index]
  end

  def list_my_undelivered_orders(user)
    orders = @order_repo.my_undelivered_orders(user)
    @orders_view.display(orders)
  end
end
