require 'nokogiri'
require 'open-uri'

require_relative 'view'
require_relative 'recipe'
require_relative 'services/scrape_bbc_good_food'


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
    # Get the recipe prep_time from the user
    prep_time = @view.ask_for("prep time")
    # Get the recipe difficulty from the user
    difficulty = @view.ask_for("difficulty")
    # Create a new recipe instance
    recipe = Recipe.new({
      name: name,
      description: description,
      prep_time: prep_time,
      difficulty: difficulty
    })
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

  def import
    # 1. Ask a user for a keyword to search
    keyword = @view.ask_for("keyword")
    # 2. Make an HTTP request to the recipe's website with our keyword
    recipes = ScrapeBbcGoodFood.call(keyword)
    # 4. Display them in an indexed list
    @view.display(recipes)
    # 5. Ask the user which recipe they want to import (ask for an index)
    index = @view.ask_for("index to import").to_i - 1
    # 6. Add it to the `Cookbook`
    recipe_to_add = recipes[index]
    @cookbook.add_recipe(recipe_to_add)
  end
end
