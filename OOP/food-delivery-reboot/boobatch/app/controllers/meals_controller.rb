require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # Retrieve the elements from the repo
    meals = @meal_repository.all
    # Display the elements with the view
    @meals_view.display(meals)
  end

  def add
    # Ask for a name
    name_input = @meals_view.ask_user_for("name")
    # Ask for a price
    price_input = @meals_view.ask_user_for("price").to_i
    # Create a meal instance
    meal = Meal.new(name: name_input, price: price_input)
    # Store it in the repo
    @meal_repository.create(meal)
    # show the meals
    list
  end
end
