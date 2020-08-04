
# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative 'app/models/meal'

require_relative 'app/repositories/meal_repository'

require_relative 'app/controllers/meals_controller'

require_relative 'router'

MEALS_CSV_FILE = File.join(__dir__, "data/meals-new.csv")

meal_repo = MealRepository.new(MEALS_CSV_FILE)

meals_controller = MealsController.new(meal_repo)

controllers = {
  meals_controller: meals_controller
}

router = Router.new(controllers)
router.run


