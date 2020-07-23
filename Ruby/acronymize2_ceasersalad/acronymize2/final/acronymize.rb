def acronymize(sentence)

  # Just Right?
  words = sentence.split
  words.map { |word| word[0].upcase }.join

  # TOO MUCH, DO LESS
  # sentence.split.map{|w|w[0].upcase}.join
end

# Running rspec without arguments will execute every file in the spec folder by convention
