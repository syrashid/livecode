# frozen_string_literal: true

require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'
require_relative 'router'

meal_csv_file = File.join(__dir__, 'data/meals.csv')
meals_repo = MealRepository.new(meal_csv_file)
meals_controller = MealsController.new(meals_repo)

customer_csv_file = File.join(__dir__, 'data/customers.csv')
customer_repo = CustomerRepository.new(customer_csv_file)
customers_controller = CustomersController.new(customer_repo)

employees_csv_file = File.join(__dir__, 'data/employees.csv')
employee_repo = EmployeeRepository.new(employees_csv_file)
sessions_controller = SessionsController.new(employee_repo)

router = Router.new(sessions_controller, meals_controller, customers_controller)
router.run
