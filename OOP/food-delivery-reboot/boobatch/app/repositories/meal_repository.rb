require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(csv_file)
  end

  def all
    @meals
  end

  def create(meal)
    # set the id
    meal.id = @next_id
    # increment next id
    @next_id += 1
    # add the meal to the meals array
    @meals << meal
    # persist the data
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << Meal.csv_headers
      @meals.each do |meal|
        csv << meal.to_array
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end
end
