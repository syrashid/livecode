# frozen_string_literal: true

class Pokemon
  attr_reader :name, :health_points
  def initialize(name, health_points = 10)
    @name = name
    @health_points = health_points
  end

  def self.types
    %w[Normal Fire Water Grass Electric Ice Fighting Poison Ground Flying Psychic Bug Rock Ghost Dragon]
  end

  def defeat(person)
    "#{@name} defeated #{person}."
  end
end
