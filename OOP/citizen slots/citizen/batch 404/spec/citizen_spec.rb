require_relative "../citizen"
describe Citizen do
  describe "#can_vote?" do
    it "returns true if the citizen is 18 years old" do
      citizen = Citizen.new('Jane', 'Doe', 18)
      expect(citizen.can_vote?).to eq(true)
    end

    it "returns false if the citizen is less than 18 years old" do
      citizen = Citizen.new('Jane', 'Doe', 17)
      expect(citizen.can_vote?).to eq(false)
    end
  end

  describe "#full_name" do
    it "returns the citizens full name" do
      citizen = Citizen.new('Jane', 'Doe', 17)
      expect(citizen.full_name).to eq('Jane Doe')
    end

    it "returns the citizens full name even with weird inputs" do
      citizen = Citizen.new('JaNE', 'DoE', 17)
      expect(citizen.full_name).to eq('Jane Doe')
    end
  end
end
