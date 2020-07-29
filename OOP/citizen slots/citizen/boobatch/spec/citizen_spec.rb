require_relative '../citizen'

describe Citizen do
  describe "#can_vote?" do
    it "returns true if the age is greater than or equal to 18" do
      citizen = Citizen.new("first", "last", 18)
      actual = citizen.can_vote?
      expected = true
      expect(actual).to eq(expected)
    end

    it "returns false if the age is less than 18" do
      citizen = Citizen.new("first", "last", 17)
      actual = citizen.can_vote?
      expected = false
      expect(actual).to eq(expected)
    end
  end

  describe "#full_name" do
    it "returns the full name of the citizen" do
      citizen = Citizen.new("Jane", "Doe", 18)
      actual = citizen.full_name
      expected = "Jane Doe"
      expect(actual).to eq(expected)
    end

    it "returns the full name of the citizen capitalized correctly" do
      citizen = Citizen.new("jaNe", "dOE", 18)
      actual = citizen.full_name
      expected = "Jane Doe"
      expect(actual).to eq(expected)
    end
  end
end
