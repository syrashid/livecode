require "csv"
require_relative "../models/meal"

class MealRepository
  def initialize(csv_file)
    # We save the filepath into an instance variable so
    # it can be used across other instance methods
    @csv_file = csv_file
    # This array will store INSTANCES of meals
    @meals = []
    # We initialize next_id in the case that there are no
    # meals or the csv file does not exist yet
    @next_id = 1
    # We perform the load_csv function if the file at the end
    # of the filepath exists
    load_csv if File.exist?(@csv_file)
  end

  def create(meal)
    # We set an id for the meal, remember the Repo is responsible
    # for managing the ids, this will be taken care by the DB later
    meal.id = @next_id
    # Yeet the meal into the meals array instance variable
    @meals << meal
    # Increment the next_id so it is available for the next meal
    # that will be added
    @next_id += 1
    # Save our current array into a csv file so the data PERSISTS
    save_csv
  end

  def all
    @meals
  end

  def find(id)
    # We use the nifty find iterator here to find the first
    # instance that has the id we pass
    # ID is an INTEGER
    @meals.find { |meal| meal.id == id }
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      # The below class method returns the headers needed for
      # the specific class we are calling this method on
      # Necessary for abstraction into a base repository
      csv << Meal.csv_headers
      @meals.each do |meal|
        # The to_array method is also created with the forethought
        # of abstracting this code into a base repo
        csv << meal.to_array
      end
    end
  end

  def load_csv
    # Options that signify the csv file has headers for the first
    # row and that we want them as symbols, this is for our model
    # which takes a hash of attributes
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      # We need to do some transforming of some of the values
      # that we get from the csv::row.  Examples here are id
      # and price which both need to be integers
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i

      # Thanks to our new way of initializing with hashes, we can
      # simply pass a hash
      @meals << Meal.new(row)
    end

    # In the case we have meals in the csv, we need to use the last
    # elements id as the basis for the next_id, we simply add 1
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end
end
