# frozen_string_literal: true

require_relative '../squirtle'

describe Squirtle do
  describe '#attack' do
    it 'Squirtle uses its signature attack' do
      adam = Squirtle.new('Adam', 50)
      expect(adam.attack).to eq('Adam uses Water Gun')
    end
  end

  describe '#defeat' do
    it 'should override the defeat method in Pokemon, use its own' do
      bubbles = Squirtle.new('Bubbles', 50)
      defeat_string = 'Bubbles defeated Brock. Squirtle always wins!'
      expect(bubbles.defeat('Brock')).to eq(defeat_string)
    end
  end
end
