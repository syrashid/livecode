class Recipe
  attr_reader :name, :description, :prep_time, :difficulty
  attr_accessor :status

  def initialize(name, description, prep_time, status = false, difficulty)
    @name = name
    @description = description
    @prep_time = prep_time
    @status = status
    @difficulty = difficulty
  end
end
