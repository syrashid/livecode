class SlotMachine
  ITEMS = { cherry: 1, seven: 2, bell: 3, star: 4, joker: 5 }
  def score(reels)
    if reels.uniq.size == 1
      ITEMS[reels[0].to_sym] * 10
    elsif reels.uniq.size == 2 && reels.include?('joker')
      ITEMS[reels.sort[1].to_sym] * 5
    else
      0
    end
  end
end


# >> CONTEXT <<

# Let’s implement a SlotMachine class with 3 reels. Each reel has 5 different items.

# The class has one public instance method, score(reels), following this rules:

# Item      Three of the same     Two of the same + Joker
# 5 Joker🤩           50             25 (2 jokers + anything)
# 4 Star⭐️            40             20
# 3 Bell🛎            30             15
# 2 Seven7️⃣           20             10
# 1 Cherry🍒          10              5

# >> REMIND SY TO COVER <<
# 1) Make the code work for you, there are no rules to this, create as needed
# 2) Look for patterns, avoid hardcoding whenever possible


# 3 of the same
