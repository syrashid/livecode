require_relative 'view'
require_relative "recipe"
require_relative 'services/scrapebbcgoodfood'
require "open-uri"
require "nokogiri"
require 'pry-byebug'

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
    # Get the preptime from the user
    prep_time = @view.ask_for("prep time")
    # Get the difficulty from the user
    difficulty = @view.ask_for("difficulty")
    # Create a recipe instance with the information
    recipe = Recipe.new(name: name, description: description, prep_time: prep_time, difficulty: difficulty)
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

  def search
    # Get keyword from the user
    keyword = @view.ask_for("search term")
    # Scrape the site
    results = ScrapeBBCGoodFood.call(keyword)
    # Display the results
    @view.display(results)
    # Retrieve the index from the user
    recipe_index = @view.ask_for("index to add").to_i
    # Add the recipe to the cookbook
    @cookbook.add_recipe(results[recipe_index - 1])
  end

  def complete
    # Display all recipes
    list
    # Ask for one to be marked as completed
    recipe_index = @view.ask_for("index to mark completed").to_i - 1
    # Complete the recipe in the cookbook
    @cookbook.complete_recipe(recipe_index)
  end
end
