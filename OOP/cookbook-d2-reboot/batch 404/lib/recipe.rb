class Recipe
  attr_reader :name, :description, :prep_time

  def initialize(attr = {})
    @name = attr[:name]
    @description = attr[:description]
    @prep_time = attr[:prep_time]
  end
end
