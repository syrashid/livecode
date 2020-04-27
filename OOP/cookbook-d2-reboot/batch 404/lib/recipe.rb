class Recipe
  attr_reader :name, :description

  def initialize(attr = {})
    @name = attr[:name]
    @description = attr[:description]
  end
end
