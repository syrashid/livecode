require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @recipes = [] # <- Recipe instances go in here
    @file_path = csv_file
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    write_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    write_csv
  end

  def complete_recipe(index)
    @recipes[index].status = true
    write_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@file_path, csv_options) do |row|
      row[:status] = row[:status] == "true"
      @recipes << Recipe.new(row)
    end
  end

  def write_csv
    CSV.open(@file_path, 'wb') do |csv|
      csv << [ "name", "description", "prep_time", "status", "difficulty"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.status, recipe.difficulty]
      end
    end
  end
end
