# frozen_string_literal: true

require_relative 'pokemon'

class Squirtle < Pokemon
  def attack
    "#{@name} uses Water Gun"
  end

  def defeat(person)
    "#{super(person)} Squirtle always wins!"
  end
end
