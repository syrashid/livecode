require_relative "../acronymize"

# First portion should be identifying the function you want to write tests for
describe "#acronymize" do
  # each it .. do .. end block will describe one test
  # This first portion is what's written in green or red when you run your tests and describes the behavior of the test
  it "returns an empty string when passed an empty string" do
    # Where you test your actual input, this is show in the get: portion of the test
    actual = acronymize("")
    # Where you put down your expected behavior
    expected = ""
    # Finally the comparison of the two
    expect(actual).to eq(expected) # passes if `actual == expected`
  end

  it "returns an SMH when passed an 'so much heroin'" do
    actual = acronymize("so much heroin")
    expected = "SMH"
    expect(actual).to eq(expected) # passes if `actual == expected`
  end

  it "returns an IDC when passed an 'I do cocaine'" do
    actual = acronymize("I do cocaine")
    expected = "IDC"
    expect(actual).to eq(expected) # passes if `actual == expected`
  end

  it "returns an ROFL when passed an 'really overdosing, fucking lit'" do
    actual = acronymize("really overdosing, fucking lit")
    expected = "ROFL"
    expect(actual).to eq(expected) # passes if `actual == expected`
  end
end
