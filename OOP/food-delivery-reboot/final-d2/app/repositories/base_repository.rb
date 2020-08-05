require "csv"

class BaseRepository
  CSV_OPTIONS = { headers: :first_row, header_converters: :symbol }
  def initialize(csv_file)
    # We save the filepath into an instance variable so
    # it can be used across other instance methods
    @csv_file = csv_file
    # This array will store INSTANCES of your desired
    # class, instead of meals or customers we'll
    # replace with elements
    @elements = []
    # We initialize next_id in the case that there are no
    # meals or the csv file does not exist yet
    @next_id = 1
    # We perform the load_csv function if the file at the end
    # of the filepath exists
    load_csv if File.exist?(@csv_file)
  end

  def create(element)
    # We set an id for the element, remember the Repo is responsible
    # for managing the ids
    element.id = @next_id
    # Yeet the element into the elemnts array instance variable
    @elements << element
    # Increment the next_id so it is available for the next meal
    # that will be added
    @next_id += 1
    # Save our current array into a csv file so the data PERSISTS
    save_csv
  end

  def all
    @elements
  end

  def find(id)
    # We use the nifty find iterator here to find the first
    # instance that has the id we pass
    # ID is an INTEGER
    @elements.find { |element| element.id == id }
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      # The below class method returns the headers needed for
      # the specific class we are calling this method on
      # Necessary for abstraction into a base repository
      csv << @elements.first.class.csv_headers
      @elements.each do |element|
        # The to_array method is also created with the forethought
        # of abstracting this code into a base repo
        csv << element.to_array
      end
    end
  end
end
