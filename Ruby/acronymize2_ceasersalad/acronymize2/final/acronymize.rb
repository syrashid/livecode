def acronymize(sentence)

  # Just Right?
  words = sentence.split
  words.map { |word| word[0].upcase }.join

  # TOO MUCH, DO LESS
  # sentence.split.map{|w|w[0].upcase}.join
end


# Sequence is, first introduce rspec, write the tests to replaces puts
# Refactor code, just keep pseudo code
# Refactor specs to keep them in their own folder

# (Explain to students that running rspec without arguments will execute every file in the spec folder by convention)
