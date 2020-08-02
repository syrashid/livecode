require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # get the recipes
    recipes = @cookbook.all
    # display the recipes
    @view.display(recipes)
  end

  def create
    # Get the recipe name from the user
    name = @view.ask_for("name")
    # Get the recipe description from the user
    description = @view.ask_for("description")
    # Create a new recipe instance
    recipe = Recipe.new(name, description)
    # Store it in the cookbook
    @cookbook.add_recipe(recipe)
    # List the recipes
    list
  end

  def destroy
    # Show the list of recipes
    list
    # Ask the user for the index that they want to delete
    index = @view.ask_for("index to delete").to_i - 1
    # Delete the recipe from the cookbook
    @cookbook.remove_recipe(index)
    # List the recipes
    list
  end
end
