# frozen_string_literal: true

require_relative 'bulbasaur'
require_relative 'charmander'
require_relative 'squirtle'

kanto_region = []

kanto_region << Charmander.new('Flyboy', 50)
kanto_region << Squirtle.new('Adam', 50)
kanto_region << Bulbasaur.new('Sauron', 50)
kanto_region << Squirtle.new('Amigoes', 50)

kanto_region.each do |pokemon|
  puts pokemon.attack
end
