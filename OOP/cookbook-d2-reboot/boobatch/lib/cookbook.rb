require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(file_path)
    @recipes = []
    @file_path = file_path
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    write_to_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    write_to_csv
  end

  private

  def load_csv
    # GOAL: Load recipes from csv file
    CSV.foreach(@file_path) do |row|
      @recipes << Recipe.new(
        { name: row[0],
          description: row[1],
          prep_time: row[2],
          difficulty: row[3]
        })
    end
  end

  def write_to_csv
    # GOAL: Save recipes INTO csv file
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@file_path, 'wb', csv_options) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.difficulty]
      end
    end
  end
end
