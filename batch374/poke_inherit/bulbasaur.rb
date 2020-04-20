# frozen_string_literal: true

require_relative 'pokemon'

class Bulbasaur < Pokemon
  def attack
    "#{@name} uses Vine Whip"
  end
end
