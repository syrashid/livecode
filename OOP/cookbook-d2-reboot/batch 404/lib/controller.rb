require_relative 'view'
require_relative 'recipe'
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
    # Get the recipe name from the user
    name = @view.ask_for("name")
    # Get the recipe description from the user
    description = @view.ask_for("description")
    # Create a recipe instance with the information
    recipe = Recipe.new(name: name, description: description)
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
    html = open("https://www.bbcgoodfood.com/search/recipes?query=#{keyword}").read
    recipes = []
    doc = Nokogiri::HTML(html, nil, 'utf-8')
    doc.search('.node-recipe').first(5).each do |node|
      attr = {}
      attr[:name] = node.search('.teaser-item__title').text.strip
      attr[:description] = node.search('.field-item').text.strip
      recipes << Recipe.new(attr)
    end
    # 4. Display them in an indexed list
    @view.display(recipes)
    # 5. Ask the user which recipe they want to import (ask for an index)
    index = @view.ask_for("index of recipe to add").to_i - 1
    # 6. Add it to the `Cookbook`
    @cookbook.add_recipe(recipes[index])
  end
end
