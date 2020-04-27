require_relative 'view'
require_relative 'recipe'
require_relative 'services/scrape_bbc_good_food'
require 'nokogiri'
require 'open-uri'

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
    # ask user for recipe details
    attr = @view.ask_for_recipe
    # Create a recipe instance with the information
    recipe = Recipe.new(attr)
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
    # 1. Ask a user for a keyword to search
    keyword = @view.ask_for("search term")
    # 2. Make an HTTP request to the recipe's website with our keyword
    # 3. Parse the HTML document to extract the first 5 recipes suggested and store them in an Array
    # Do all of the above in the below service object
    recipes = ScrapeBbcGoodFood.call(keyword)
    # 4. Display them in an indexed list
    @view.display(recipes)
    # 5. Ask the user which recipe they want to import (ask for an index)
    index = @view.ask_for("index of recipe to add").to_i - 1
    # 6. Add it to the `Cookbook`
    @cookbook.add_recipe(recipes[index])
  end

  def complete
    # list all the recipes for a user to view
    list
    # ask a user for what recipe they want to mark as complete
    recipe_index = @view.ask_for("index to mark completed").to_i - 1
    # tell the cookbook to mark said recipe as complete
    @cookbook.complete_recipe(recipe_index)
  end
end
