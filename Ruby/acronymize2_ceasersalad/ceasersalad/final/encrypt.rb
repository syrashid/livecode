# Play Mission Impossible music as the students walk in
# https://www.youtube.com/watch?v=FK6_o1tcIj0

# Le Wagon Students, you've been selected for a top secret mission by MI6.  You've been tasked by the Queen to understand the secret terrorist organization that has destabalized American politics and helped elect Donald Trump to power.  This mission is of the utmost importance as destabalization across multiple countries is feared.  You've been given a secret USB drive with a message on it that reads as follows:

# Agents the key to solving this crisis is by building an encrypter that allows you to send secret messages with no one knowing, see the link for instructions

# https://kitt.lewagon.com/camps/348/challenges?feature=livecode&amp;path=01-Ruby%2F03-Iterators-Blocks&feature=livecode


def encrypt(text)
  # 1. Define an array with the 26 letters of the alphabet (in capital letters)
  key = ('A'..'Z').to_a
  # 2. Split the text in a `letters` array
  characters = text.chars
  # 3. Iterate over letters, for each letter, test its inclusion in the alphabet
  characters.map do |char|
    # 4. Map the letter to its left-shift or to itself
    if key.include?(char)
      index = key.index(char)
      key[index - 3]
    else
      char
    end
  # 5. Join the mapped array and return it
  end.join
end

# Once you've built that you'll need to build a variable encrypter that allows for shifts other than 3 letters as our enemies are always cracking our codes

def encrypt_variable(text, shift = 3)
  # Note the optional parameter above
  # 1. Define an array with the 26 letters of the alphabet (in capital letters)
  key = ('A'..'Z').to_a
  # 2. Split the text in a `letters` array
  characters = text.chars
  # 3. Iterate over letters, for each letter, test its inclusion in the alphabet
  characters.map do |char|
    # 4. Map the letter to its left-shift or to itself
    if key.include?(char)
      index = key.index(char)
      # We perform modulo division here to account for when the shift causes the index searched in the key array to be greater than 25, which would return a nil if not accounted for
      key[(index - shift)%26]
    else
      char
    end
  # 5. Join the mapped array and return it
  end.join
end

# Finally once you have the encryptor, you'll be able to build the decryptor tool to give you acccess to this message stolen from the interior US CIA to understand the crisis
# "TB'OB XZQRXIIV GRPQ OBXIIV ARJY XKA XZQRXIIV YBIFBSB TEXQ ZLJBP LRQ LC EFP JLRQE"

def decode(text)
  encrypt_variable(text, -3)
end

puts decode("TB'OB XZQRXIIV GRPQ OBXIIV ARJY XKA XZQRXIIV YBIFBSB TEXQ ZLJBP LRQ LC EFP JLRQE")


