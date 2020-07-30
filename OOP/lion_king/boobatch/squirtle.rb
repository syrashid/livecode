require_relative 'pokemon'

class Squirtle < Pokemon
  def attack
    "#{@name} used Water Gun"
  end

  def defeats(person)
    super(person) + "  Squirtle always wins!"
  end
end
