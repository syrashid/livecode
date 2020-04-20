require_relative '../frequencies'

describe '#frequencies' do
  it 'should return an empty Hash' do
    actual = frequencies('')
    expected = {}
    expect(actual).to eq(expected)
  end

  it 'should return a word_hash with a string' do
    actual = frequencies('the lazy dog jumped over the brown fox')
    expected = {  'the' => 2,
                  'lazy' => 1,
                  'dog' => 1,
                  'jumped' => 1,
                  'over' => 1,
                  'brown' => 1,
                  'fox' => 1 }
    expect(actual).to eq(expected)
  end
end
