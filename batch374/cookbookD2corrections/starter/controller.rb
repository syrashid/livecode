# frozen_string_literal: true

require_relative 'view'
require 'nokogiri'
require_relative 'recipe'
require 'open-uri'
require 'pry'
require_relative 'services/scrapebbcgoodfood.rb'

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
    # 1. Ask user for a name (view)
    name = @view.ask_for_stuff('name')
    # 2. Ask user for a description (view)
    description = @view.ask_for_stuff('Description')
    # 3. Ask user for a prep_time (view)
    prep_time = @view.ask_for_stuff('Prep time')
    # 4. Ask user for completion status (view)
    completed = @view.ask_for_stuff('status of completion (return true/false)')
    # 5. Ask user for difficulty (view)
    difficulty = @view.ask_for_stuff('recipe difficulty')
    # 6. Create recipe with all the information collected(model)
    recipe = Recipe.new(name, description, prep_time, completed == 'true', difficulty)
    # 7. Store in cookbook (repo)
    @cookbook.add_recipe(recipe)
    # 8. Display
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
    # 1. Get a keyword from a user
    keyword = @view.ask_for_stuff('keyword to search for')

    # 2. Call the scraper service we built, notice we create an instance first then call
    recipes = ScrapeBBCGoodFood.new(keyword).call

    # 3. Save the user's desired results
    @view.display(recipes)
    recipe_index = @view.ask_for_stuff('index to add').to_i - 1
    @cookbook.add_recipe(recipes[recipe_index])
  end

  def complete
    # 1. Render list and ask user for index to mark completed
    display_list
    recipe_index = @view.ask_for_stuff('index of completed recipe').to_i - 1
    # 2. Retrieve repo and find the selected recipe using the index, mark as true
    recipes = @cookbook.all
    recipes[recipe_index].status = true
    # 3. Save the cookbook with the updated recipe a custom method in cookbook
    @cookbook.save_recipes
  end

  private

  def display_list
    # 1. Get recipes (repo)
    recipes = @cookbook.all
    # 2. Display recipes in the terminal (view)
    @view.display(recipes)
  end
end
