require_relative 'charmander'
require_relative 'squirtle'
require_relative 'bulbasaur'

pokemons = []

bob = Charmander.new("Bob", 50)
james = Squirtle.new("James", 50)
charles = Bulbasaur.new("Charles", 50)
bubbles = Squirtle.new("Bubbles", 50)

pokemons << bob
pokemons << james
pokemons << charles
pokemons << bubbles



pokemons.each do |pokemon|
  puts pokemon.attack
end

p bubbles.defeats("Brock")
p bob.defeats("Erica")

p Pokemon.types


