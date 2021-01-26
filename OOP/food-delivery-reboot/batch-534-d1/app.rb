require_relative './router'

require_relative './app/models/meal'
require_relative './app/repositories/meal_repository'
require_relative './app/controllers/meals_controller'
# As a user I can list all the meals
# As a user I can add a meal

# Building Our Meal Components
csv_file_path = File.join(__dir__, 'data/meals.csv')
meal_repo = MealRepository.new(csv_file_path)
meals_controller = MealsController.new(meal_repo)

controllers = {
  meals_controller: meals_controller
}

router = Router.new(controllers)
router.run

