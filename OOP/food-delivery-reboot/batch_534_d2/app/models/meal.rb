class Meal
  attr_accessor :id
  attr_reader :name, :price

  def self.csv_headers
    %w[id name price]
  end

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def to_array
    [@id, @name, @price]
  end

  def to_s
    "#{self.name} | Price: #{self.price}€"
  end
end
