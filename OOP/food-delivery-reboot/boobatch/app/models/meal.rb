class Meal
  attr_accessor :id
  attr_reader :name, :price

  def self.csv_headers
    %w[id name price]
  end

  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @price = attr[:price]
  end

  def to_s
    "#{self.name} | Price: $#{self.price}"
  end

  def to_array
    [@id, @name, @price]
  end

end
