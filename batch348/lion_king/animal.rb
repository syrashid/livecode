# frozen_string_literal: true

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def eat(food)
    "#{@name} eats #{food}"
  end

  def self.phyla
    %w[Deuterostomia Edysozoa Lophotrochozoa Radiata]
  end
end
