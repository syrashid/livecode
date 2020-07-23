def acronymize(sentence)
  # take each word in our sentence and save as an array
  # take the first letter of EACH element
  # capitalize each letter
  # store letters in an array
  # return our string

  # Can we make this into one line?  Should we make this into one line?

  words = sentence.split

  letters = words.map { |word| word[0].upcase }

  letters.join

  # s.split.map { |w| w[0].upcase }.join
end


puts acronymize("This phrase Over here")  #TPOH
puts acronymize("Read the fucking manual")  # RTFM
# Let's make these into real tests




# Some acronyms I want to play with
# SMH <- So much heroin
# ROFL <- Really overdosing, fucking lit
# IDC <- I do crack
