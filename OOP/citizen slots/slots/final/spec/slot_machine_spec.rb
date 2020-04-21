# require_relative "../slot_machine"

# describe SlotMachine do
#   describe "#score" do
#     it "returns 0 for three different symbols" do
#       slot_machine = SlotMachine.new
#       score = slot_machine.score([ "joker", "star", "bell" ])
#       expect(score).to eq(0)
#     end

#     it "returns 25 for two jokers +" do
#       slot_machine = SlotMachine.new
#       score = slot_machine.score([ "joker", "joker", "bell" ])
#       expect(score).to eq(25)
#     end

#     it "returns 20 for 2 stars & joker" do
#       slot_machine = SlotMachine.new
#       score = slot_machine.score([ "star", "star", "joker" ])
#       expect(score).to eq(20)
#     end

#     it "returns 10 for 2 sevens & joker" do
#       slot_machine = SlotMachine.new
#       score = slot_machine.score([ "seven", "seven", "joker" ])
#       expect(score).to eq(10)
#     end

#     it "returns 50 for three jokers" do
#       slot_machine = SlotMachine.new
#       score = slot_machine.score([ "joker", "joker", "joker" ])
#       expect(score).to eq(50)
#     end

#     it "returns 30 for two bells" do
#       slot_machine = SlotMachine.new
#       score = slot_machine.score([ "bell", "bell", "bell" ])
#       expect(score).to eq(30)
#     end

#     it "returns 10 for three cherries" do
#       slot_machine = SlotMachine.new
#       score = slot_machine.score([ "cherry", "cherry", "cherry" ])
#       expect(score).to eq(10)
#     end
#   end
# end

require_relative '../slot_machine'

def test_scenario(reels, expected_score)
  it "returns #{expected_score} for |#{reels[0]}|#{reels[1]}|#{reels[2]}|" do
    slot_machine = SlotMachine.new
    score = slot_machine.score(reels)
    expect(score).to eq(expected_score)
  end
end

describe SlotMachine do
  describe '#score' do
    it 'returns 0 for three different symbols' do
      slot_machine = SlotMachine.new
      score = slot_machine.score(%w[joker star bell])
      expect(score).to eq(0)
    end

    test_scenario(%w[joker joker joker], 50)
    test_scenario(%w[star star star], 40)
    test_scenario(%w[bell bell bell], 30)
    test_scenario(%w[seven seven seven], 20)
    test_scenario(%w[cherry cherry cherry], 10)

    test_scenario(%w[joker joker star], 25)
    test_scenario(%w[joker joker bell], 25)
    test_scenario(%w[joker joker seven], 25)
    test_scenario(%w[joker joker cherry], 25)

    test_scenario(%w[star star joker], 20)
    test_scenario(%w[bell bell joker], 15)
    test_scenario(%w[seven seven joker], 10)
    test_scenario(%w[cherry cherry joker], 5)

    test_scenario(%w[star star bell], 0)
    test_scenario(%w[star star seven], 0)
    test_scenario(%w[star star cherry], 0)
    test_scenario(%w[bell bell star], 0)
    test_scenario(%w[bell bell seven], 0)
    test_scenario(%w[bell bell cherry], 0)
    test_scenario(%w[seven seven star], 0)
    test_scenario(%w[seven seven bell], 0)
    test_scenario(%w[seven seven cherry], 0)
    test_scenario(%w[cherry cherry star], 0)
    test_scenario(%w[cherry cherry bell], 0)
    test_scenario(%w[cherry cherry seven], 0)
  end
end
