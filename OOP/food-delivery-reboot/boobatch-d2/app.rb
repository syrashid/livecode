# Require all models
require_relative 'app/models/meal'
require_relative 'app/models/customer'

# Require all repositories
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'

# Require all controllers
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'

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

# Organize all controllers in a hash to be used in the Router:
controllers = {
  customers_controller: customers_controller,
  meals_controller: meals_controller
}

router = Router.new(controllers)

# Start the program:
router.run
