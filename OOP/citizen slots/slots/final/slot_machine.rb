class SlotMachine
  SYMBOLS = %w[🍒 7️⃣ 🛎 ⭐️ 🤩]
  ITEMS = { cherry: 1, seven: 2, bell: 3, star: 4, joker: 5 }
  def initialize(reels = %w[joker star bell])
    @reels = reels
  end

  def play
    animation
    shuffle_reels
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

  def animation
    60.times do
      reel_display = 3.times.collect{SYMBOLS.sample}
      print reel_display.join("\t") + "\r"
      $stdout.flush
      sleep(0.03)
    end
  end

  def three_identical?
    @reels.uniq.size == 1
  end

  def two_identical_and_joker?
    @reels.uniq.size == 2 && @reels.include?('joker')
  end

  def shuffle_reels
    @reels = []
    3.times { @reels << ITEMS.keys.sample.to_s }
  end
end
