class SlotMachine
  ITEMS = { cherry: 1, seven: 2, bell: 3, star: 4, joker: 5 }
  def initialize(reels)
    @reels = reels
  end

  def play
    @reels = []
    3.times do
      @reels << ITEMS.keys.sample
    end
    @reels
  end

  def score
    if three_identical?
      ITEMS[@reels[0].to_sym] * 10
    elsif two_identical_and_joker?
      ITEMS[@reels.sort[1].to_sym] * 5
    else
      0
    end
  end

  private

  def three_identical?
    @reels.uniq.size == 1
  end

  def two_identical_and_joker?
    @reels.uniq.size == 2 && @reels.include?('joker')
  end
end
