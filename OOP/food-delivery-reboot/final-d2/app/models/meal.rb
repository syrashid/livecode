class Meal
  attr_accessor :id # read and write :id
  attr_reader :name, :price

  # It makes sense that the class would know
  # what CSV headers are needed to persist
  # instances of itself.
  #
  def self.csv_headers
    # Shorthand for Array of symbols:
    # %i[id name price] => [:id, :name, :price]
    # Shortand for Array of strings:
    # %w => ["id", "name", "price"]
    %w[id name price]
  end

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  # We use this #to_array method to abstract our repository classes,
  # It makes sense the instance should know how to pass itself as relevant information for a csv row
  def to_array
    [@id, @name, @price]
  end

  # In Ruby, most objects RESPOND to a .to_s call.
  # However, if you do not override the implementation
  # of this method, converting an instance of Meal
  # to String would look like this:
  #
  # #<Meal:0x00007ff4be01dc08>
  #
  # We want to teach our model to display its data as
  # a string so that we can use it in the View
  # The selves are unnnecessary, but I've put them in for
  # clarification that they are methods and not local variables
  def to_s
    "#{self.name} | Price: #{self.price}€"
  end
end
