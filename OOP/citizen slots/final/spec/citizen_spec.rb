require_relative "../citizen"

describe Citizen do # << This is different
  describe "#can_vote?" do
    it "returns true if the citizen is 18 years old" do
      citizen = Citizen.new("", "", 18)
      expect(citizen.can_vote?).to eq(true)
    end

    it "returns false if the citizen is less than 18 years old" do
      citizen = Citizen.new("", "", 17)
      expect(citizen.can_vote?).to eq(false)
    end

    it "returns their full name" do
      citizen = Citizen.new("John", "Doe", 18)
      expect(citizen.full_name).to eq('John Doe')
    end

    it "returns their full name capitalized correctly" do
      citizen = Citizen.new("JoHn", "DOE", 18)
      expect(citizen.full_name).to eq('John Doe')
    end
  end
end
