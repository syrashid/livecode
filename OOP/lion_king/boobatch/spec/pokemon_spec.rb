require_relative '../pokemon'

describe Pokemon do
  describe '#initialize' do
    it 'creates an instance of the Pokemon class' do
      # expected & actual
      sparky = Pokemon.new('Sparky', 50)
      expect(sparky).to be_a(Pokemon)
    end
  end

  describe '#name' do
    it 'returns the name of the pokemon instance' do
      sparky = Pokemon.new('Sparky', 50)
      expect(sparky.name).to eq('Sparky')
    end
  end

  describe '#health_points' do
    it 'returns the health points of the pokemon instance' do
      sparky = Pokemon.new('Sparky', 50)
      expect(sparky.health_points).to eq(50)
    end
  end

end

