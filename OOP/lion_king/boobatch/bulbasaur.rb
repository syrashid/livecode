require_relative 'pokemon'

class Bulbasaur < Pokemon
  def attack
    "#{@name} used Vine Whip"
  end
end
