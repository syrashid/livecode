require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @meals
  end

  def create(meal)
    # Assign the meal an id
    meal.id = @next_id
    # Figure out the next id
    @next_id += 1
    # Yeet the meal into the meals array
    @meals << meal
    # save to csv
    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      # Translate the information from the csv into the right data types
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      # Create an instance of our element
      @meals << Meal.new(row)
    end

    @next_id = @meals.last.id + 1 unless @meals.empty?
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << Meal.csv_headers
      @meals.each do |meal|
        csv << meal.to_array
      end
    end
  end
end
