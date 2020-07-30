# frozen_string_literal: true

require_relative 'bulbasaur'
require_relative 'charmander'
require_relative 'squirtle'

pokemons = []

pokemons << Charmander.new('Flyboy', 50)
pokemons << Squirtle.new('Adam', 50)
pokemons << Bulbasaur.new('Sauron', 50)
pokemons << Squirtle.new('Amigoes', 50)

pokemons.each do |pokemon|
  puts pokemon.attack
end

# This is where you need to explain the concept of polymorphism & ducktyping

# Polymorphism
# So polymorphism is the ability (in programming) to present the same interface for differing underlying forms (data types).
# For example, in many languages, integers and floats are implicitly polymorphic since you can add, subtract, multiply and so on, irrespective of the fact that the types are different. They're rarely considered as objects in the usual term.

# Duck Typing
# Static vs dynamic typing (duck typing)
# Compiler doesn't need to check the type before it calls it, you using the method defines the instance


