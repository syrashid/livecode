require_relative '../acronymize'

describe "acronymize"  do
  it "should return an empty string when passed an empty string" do
    got = acronymize("")
    expected = ""
    expect(got).to eq(expected)
  end

  it "should return an SMH when passed so much heroin" do
    actual = acronymize("so much heroin")
    expected = "SMH"
    expect(actual).to eq(expected)
  end

  it "should return an IDC when passed I do crack" do
    actual = acronymize("I do crack")
    expected = "IDC"
    expect(actual).to eq(expected)
  end

  it "should return an IDC when passed I do crack" do
    actual = acronymize("really overdosing, fucking lit")
    expected = "ROFL"
    expect(actual).to eq(expected)
  end
end
