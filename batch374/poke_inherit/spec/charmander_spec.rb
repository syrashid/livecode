# frozen_string_literal: true

require_relative '../charmander'

describe Charmander do
  describe '#attack' do
    it 'uses its signature attack' do
      flyboy = Charmander.new('Flyboy', 50)
      expect(flyboy.attack).to eq('Flyboy uses Ember')
    end
  end
end
