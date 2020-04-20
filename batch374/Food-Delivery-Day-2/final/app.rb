# frozen_string_literal: true

require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/repositories/order_repository'
require_relative 'app/controllers/orders_controller'
require_relative 'router'

meal_csv_file = File.join(__dir__, 'data/meals.csv')
meal_repo = MealRepository.new(meal_csv_file)
meals_controller = MealsController.new(meal_repo)

customer_csv_file = File.join(__dir__, 'data/customers.csv')
customer_repo = CustomerRepository.new(customer_csv_file)
customers_controller = CustomersController.new(customer_repo)

employee_csv_file = File.join(__dir__, 'data/employee.csv')
employee_repo = EmployeeRepository.new(employee_csv_file)
sessions_controller = SessionsController.new(employee_repo)

orders_csv = 'data/orders.csv'
order_repo = OrderRepository.new(orders_csv, meal_repo, employee_repo, customer_repo)
orders_controller = OrdersController.new(meal_repo, employee_repo, customer_repo, order_repo)

router = Router.new(sessions_controller, meals_controller, customers_controller, orders_controller)
router.run
