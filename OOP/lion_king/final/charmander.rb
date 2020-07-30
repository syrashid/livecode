# frozen_string_literal: true

require_relative 'pokemon'

class Charmander < Pokemon
  def attack
    "#{@name} uses Ember"
  end
end
