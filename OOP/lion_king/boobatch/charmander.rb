require_relative 'pokemon'

class Charmander < Pokemon
  def attack
    "#{@name} used Ember"
  end
end
