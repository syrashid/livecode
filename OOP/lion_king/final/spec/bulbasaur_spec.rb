# frozen_string_literal: true

require_relative '../bulbasaur'

describe Bulbasaur do
  describe '#attack' do
    it 'Bulbasaur uses its signature attack' do
      sauron = Bulbasaur.new('Sauron', 50)
      expect(sauron.attack).to eq('Sauron uses Vine Whip')
    end
  end
end
