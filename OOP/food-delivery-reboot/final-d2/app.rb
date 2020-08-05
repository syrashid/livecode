# Require all models
require_relative 'app/models/meal'
require_relative 'app/models/customer'
require_relative 'app/models/employee'

# Require all repositories
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'

# Require all controllers
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/sessions_controller'

# Require the router
require_relative "router"

# The router needs to receive ALL of the controllers...

# In order to create a MealsController, I need to...
# have a string with the Meals CSV filepath...
MEALS_CSV_FILE = File.join(__dir__, "data/meals.csv")
# so that I can use it to create a MealRepository...
meal_repository = MealRepository.new(MEALS_CSV_FILE)
# that can be used to create the MealsController:
meals_controller = MealsController.new(meal_repository)


# In order to create a CustomersController, I need to...
# have a string with the Customers CSV filepath...
CUSTOMERS_CSV_FILE = File.join(__dir__, "data/customers.csv")
# so that I can use it to create a CustomerRepository...
customer_repository = CustomerRepository.new(CUSTOMERS_CSV_FILE)
# that can be used to create the CustomersController:
customers_controller = CustomersController.new(customer_repository)

# In order to create a SessionsController, I need to...
# have a string with the Employees CSV filepath...
EMPLOYEES_CSV_FILE = File.join(__dir__, "data/employees.csv")
# so that I can use it to create a EmployeeRepository...
employee_repository = EmployeeRepository.new(EMPLOYEES_CSV_FILE)
# that can be used to create the CustomersController:
sessions_controller = SessionsController.new(employee_repository)

# Organize all controllers in a hash to be used in the Router:
controllers = {
  customers_controller: customers_controller,
  meals_controller: meals_controller,
  sessions_controller: sessions_controller
}

# In order to create an OrdersController, I need to...
# have a string with the Orders CSV filepath...
ORDERS_CSV_FILE = File.join(__dir__, "data/orders.csv")
# and a controllers hash so that I can use it to create an OrderRepository...
order_repository = OrderRepository.new(EMPLOYEES_CSV_FILE, controllers)
# that can be used to create the OrdersController with all the repos:
repositories = {
  customers_repository: customers_repository,
  meals_repository: meals_repository,
  sessions_repository: sessions_repository,
  order_repository: order_repository
}

orders_controller = OrdersController.new(repositories)

router = Router.new(controllers)

# Start the program:
router.run
