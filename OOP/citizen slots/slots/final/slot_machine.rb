class SlotMachine
  ITEMS = {cherry: 1, seven: 2, bell: 3, star: 4, joker: 5 }

  def score(reels)
    if reels.uniq.size == 1
      ITEMS[reels[0].to_sym] * 10
    elsif reels.uniq.size == 2 && reels.include?('joker')
      # sorting the array of 3 strings to make sure index 1 is one of the pair
      ITEMS[reels.sort[1].to_sym] * 5
    else
      0
    end
  end
end
