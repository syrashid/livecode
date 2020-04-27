class Recipe
  attr_reader :name, :description, :prep_time, :difficulty
  attr_accessor :status

  def initialize(attr = {})
    @name = attr[:name]
    @description = attr[:description]
    @prep_time = attr[:prep_time]
    @status = attr[:status] || false
    @difficulty = attr[:difficulty]
  end
end
