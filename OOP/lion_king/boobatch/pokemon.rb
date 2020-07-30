class Pokemon
  attr_reader :name, :health_points

  def initialize(name, health_points)
    @name = name
    @health_points = health_points
  end

  def self.types
    %w[Normal Fire Water Grass Electric Ice Fighting Poison Ground Flying Psychic Bug Rock Ghost Dragon]
  end

  def defeats(person)
    "#{@name} defeated #{person}."
  end

end
