# frozen_string_literal: true

require_relative '../lion'

describe Lion do
  describe '#initialize' do
    it 'creates a Lion instance' do
      lion = Lion.new('Simba')
      expect(lion).to be_a(Lion)
    end
  end

  describe '#talk' do
    it 'returns a sentence stating the lion is roaring' do
      simba = Lion.new('Simba')
      expect(simba.talk).to eq('Simba roars')
    end
  end

  describe '#eat' do
    it 'overrides Animal#eat and returns a cruel sentence' do
      simba = Lion.new('Simba')
      sentence = simba.eat('a gazelle')
      expect(sentence).to eq('Simba eats a gazelle. Law of the Jungle!')
    end
  end
end
