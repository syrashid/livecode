require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/employees_view"
require_relative "../views/orders_view"
require 'pry-byebug'

class OrdersController
  def initialize(attr={})
    # Needed to retrive instances of elements based on user choices in the add functionality
    @meal_repo = attr[:meal_repo]
    @customer_repo = attr[:customer_repo]
    @employee_repo = attr[:employee_repo]
    @order_repo = attr[:order_repo]
    # Used to display element choices in the add funcionality
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    # Note the employees view NOT the session view, the employee view is responsible for display prompts as they relate to the employee, the session as they relate to a session
    @employees_view = EmployeesView.new
    @orders_view = OrdersView.new
  end

  def add
    # Choose the meal, customer, and employee
    meal = select_meal
    customer = select_customer
    employee = select_employee
    # Create your order
    order = Order.new(meal: meal, customer: customer, employee: employee)
    # Add it to the repo
    @order_repo.create(order)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repo.undelivered_orders
    @orders_view.display(undelivered_orders)
  end

  def list_my_orders(current_user)
    orders = @order_repo.my_undelivered_orders(current_user)
    @orders_view.display(orders)
  end

  def mark_as_delivered(current_user)
    # list undelelivered orders for current user
    list_my_orders(current_user)
    # Have them choose
    index = @orders_view.ask_user_for_index
    # Retrieve all orders for that user
    my_orders = @order_repo.my_undelivered_orders(current_user)
    # Retrive the specific now delivered order based on user input
    order = my_orders[index]
    # Mark that order as delivered
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
    @employees_view.display(employees)
    index = @orders_view.ask_user_for_index
    return employees[index]
  endl
end
