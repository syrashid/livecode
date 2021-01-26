require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # Retrieve all of the meals
    meals = @meal_repository.all
    # Display the meals
    @meals_view.display(meals)
  end

  def add
    # Ask user for a name
    name = @meals_view.ask_user_for('name')
    # Ask use for a price
    price = @meals_view.ask_user_for('price').to_i
    # Make a meal instance
    meal = Meal.new(name: name, price: price)
    # Create it in the meal repo
    @meal_repository.create(meal)
    # list the meals again to show you were successful
    list
  end
end
