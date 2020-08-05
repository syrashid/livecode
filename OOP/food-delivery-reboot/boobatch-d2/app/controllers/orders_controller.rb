require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../views/orders_view'
require_relative '../views/employees_view'

class OrdersController
  def initialize(attr={})
    @meal_repo = attr[:meal_repo]
    @customer_repo = attr[:customer_repo]
    @employee_repo = attr[:employee_repo]
    @order_repo = attr[:order_repo]
    @meals_view = MealsView.new
    @employees_view = EmployeesView.new
    @customers_view = CustomersView.new
    @orders_view = OrdersView.new
  end

  def add
    # Display and get a meal choice thru index
    meal = select_meal
    # Same for customer
    customer = select_customer
    # Same for employee
    employee = select_employee
    # create an instance order and pass all the stuff I just got
    order = Order.new(meal: meal, customer: customer, employee: employee)
    # add it to the order repository
    @order_repo.create(order)
    # Display the undelivered orders again
    list_undelivered_orders
  end

  def list_undelivered_orders
    # Get the undelivered orders from the repo
    undelivered_orders = @order_repo.undelivered_orders
    # Display them
    @orders_view.display(undelivered_orders)
  end

  private

  def select_meal
    # Prompt the user what they are doing
    @orders_view.prompt_for("meal")
    # Display all the meals
    meals = @meal_repo.all
    @meals_view.display(meals)
    # Ask the user for a meal index
    index = @orders_view.ask_user_for_index
    # From the index find a meal instance
    meals[index]
  end

  def select_customer
    # Prompt the user what they are doing
    @orders_view.prompt_for("customer")
    # Display all the customers
    customers = @customer_repo.all
    @customers_view.display(customers)
    # Ask the user for a customer index
    index = @orders_view.ask_user_for_index
    # From the index find a customer instance
    customers[index]
  end

  def select_employee
    # Prompt the user what they are doing
    @orders_view.prompt_for("employee")
    # Display all the employees
    employees = @employee_repo.all
    @employees_view.display(employees)
    # Ask the user for a employee index
    index = @orders_view.ask_user_for_index
    # From the index find a employee instance
    employees[index]
  end
end
