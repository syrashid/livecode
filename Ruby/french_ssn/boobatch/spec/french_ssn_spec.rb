require_relative "../french_ssn"

describe "#french_ssn" do
  it "returns 'the number is invalid' when passed an empty string" do
    actual = french_ssn("")
    expected = "The number is invalid"
    expect(actual).to eq(expected)
  end

  it "returns 'the number is invalid' when passed an integer" do
    actual = french_ssn(184127645108946)
    expected = "The number is invalid"
    expect(actual).to eq(expected)
  end

  it "returns 'a man, born in December, 1984 in Seine-Maritime.' when passed a valid ssn" do
  actual = french_ssn("1 84 12 76 451 089 46")
  expected = 'a man, born in December, 1984 in Seine-Maritime.'
  expect(actual).to eq(expected)
  end

end
