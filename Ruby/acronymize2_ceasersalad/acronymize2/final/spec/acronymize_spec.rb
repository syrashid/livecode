require_relative "../acronymize"

describe "#acronymize" do
  it "returns an empty string when passed an empty string" do
    actual = acronymize("")
    expected = ""
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
