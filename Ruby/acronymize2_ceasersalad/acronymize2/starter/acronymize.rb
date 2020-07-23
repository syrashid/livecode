# Write a method that returns the acronym of a sentence.
# "Create Read Update Delete" = "CRUD"
# "Chief Executive Officer" = "CEO"
# "Read the fucking menu" = "RTFM"

def acronymize(sentence)
  # take each word in our sentence and save as an array
  # take the first letter of EACH element
  # capitalize each letter
  # store letters in an array
  # return our string

  # Can we make this into one line?  Should we make this into one line?

  words = sentence.split
  acronym = []
  words.each do |word|
    acronym << word[0].upcase
  end
  acronym.join
end

# Let's make these into real tests

puts acronymize("Create Read Update Delete")
puts acronymize("Read the fucking menu")

# Some acronyms I want to play with
# SMH <- So much heroin
# ROFL <- Really overdosing, fucking lit
# IDC <- I do crack
