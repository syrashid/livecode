# frozen_string_literal: true

require_relative '../animal'

describe Animal do
  describe '#initialize' do
    it 'creates an Animal instance' do
      animal = Animal.new('Babe')
      expect(animal).to be_an(Animal) # 🚨 New matcher alert 🚨
    end
  end

  describe '#name' do
    it 'returns the name of the Animal instance' do
      animal = Animal.new('Babe')
      expect(animal.name).to eq('Babe')
    end
  end

  describe '::phyla' do
    it 'returns all phyla of the animal kingdom' do
      phyla = Animal.phyla
      expect(phyla.size).to eq(4)
    end
  end

  describe '#eat' do
    it 'returns a sentence stating the animal is eating some food' do
      animal = Animal.new('Babe')
      sentence = animal.eat('a carrot')
      expect(sentence).to eq('Babe eats a carrot')
    end
  end
end
