require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @view = View.new
    @cookbook = cookbook
  end

  def list
    # get the recipes from the repo
    recipes = @cookbook.all
    # send them to the view to display
    @view.display(recipes)
  end

  def create
    # Get the recipe name from the user
    name = @view.ask_for("name")
    # Get the recipe description from the user
    description = @view.ask_for("description")
    # Create a recipe instance with the information
    recipe = Recipe.new(name, description)
    # Store it in the cookbook
    @cookbook.add_recipe(recipe)
    # list the recipes
    list
  end

  def destroy
    # list the recipes
    list
    # ask the user for the index
    index = @view.ask_for("index to delete").to_i - 1
    # remove it from the cookbook
    @cookbook.remove_recipe(index)
    # list the recipes
    list
  end
end
