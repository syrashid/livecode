require_relative 'view'
require_relative 'services/scrapebbcgoodfood'
require "open-uri"
require "nokogiri"
require_relative "recipe"
require 'pry'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  # USER ACTIONS

  def list
    display_list
  end

  def create
    name = @view.ask_for_stuff("name")

    description = @view.ask_for_stuff("Description")

    prep_time = @view.ask_for_stuff("Prep Time")

    difficulty = @view.ask_for_stuff("Difficulty")

    recipe = Recipe.new(name, description, prep_time, difficulty)

    @cookbook.add_recipe(recipe)

    display_list
  end

  def destroy
    # 1. Display recipes
    display_list
    # 2. Ask user for index (view)
    index = @view.ask_for_index
    # 3. Remove from cookbook (repo)
    @cookbook.remove_recipe(index)
    # 4. Display
    display_list
  end

  def search
    keyword = @view.ask_for_stuff("search term")
    results = ScrapeBBCGoodFood.new(keyword).call
    @view.display(results)
    recipe_index = @view.ask_for_stuff("index to add").to_i

    @cookbook.add_recipe(results[recipe_index - 1])
  end

  def complete
    display_list
    recipe_index = @view.ask_for_stuff("index to mark completed").to_i - 1
    @cookbook.complete_recipe(recipe_index)
  end

  private

  def display_list
    # 1. Get recipes (repo)
    recipes = @cookbook.all
    # 2. Display recipes in the terminal (view)
    @view.display(recipes)
  end
end
