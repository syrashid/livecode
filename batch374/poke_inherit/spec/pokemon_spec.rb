# frozen_string_literal: true

require_relative '../pokemon'

describe Pokemon do
  describe 'initialize' do
    it 'creates an instance of the Pokemon class' do
      sparky = Pokemon.new('Sparky', 50)
      expect(sparky).to be_a(Pokemon)
    end
  end

  describe '#name' do
    it 'returns the name of the Pokemon instance' do
      sparky = Pokemon.new('Sparky', 50)
      expect(sparky.name).to eq('Sparky')
    end
  end

  describe '#health_points' do
    it 'returns the pokemons health points' do
      sparky = Pokemon.new('Sparky', 50)
      expect(sparky.health_points).to eq(50)
    end
  end

  describe '::type' do
    it 'returns all 15 types in the Kanto Region' do
      types = Pokemon.types
      expect(types.size).to eq(15)
    end
  end

  describe '#defeat' do
    it 'returns a string saying the pokemon beat the person' do
      sparky = Pokemon.new('Sparky', 50)
      defeat_string = sparky.defeat('Misty')
      expect(defeat_string).to eq('Sparky defeated Misty.')
    end
  end
end
