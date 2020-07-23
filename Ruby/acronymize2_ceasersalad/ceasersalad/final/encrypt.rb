# Play Mission Impossible music as the students walk in
# https://www.youtube.com/watch?v=FK6_o1tcIj0

# Le Wagon Students, you've been selected for a top secret mission by MI6.  You've been tasked by the Queen to understand the secret terrorist organization that has destabalized American politics and helped elect Donald Trump to power.  This mission is of the utmost importance as destabalization across multiple countries is feared.  You've been given a secret USB drive with a message on it that reads as follows:

# Agents the key to solving this crisis is by building an encrypter that allows you to send secret messages with no one knowing, see the link for instructions

# https://kitt.lewagon.com/camps/348/challenges?feature=livecode&amp;path=01-Ruby%2F03-Iterators-Blocks&feature=livecode

# Start by working out the psuedo code together, send to everyone on slack

def encrypt(text)
  # 1. Define an array with the 26 letters of the alphabet (in capital letters)
  # 2. Split the text in a `letters` array
  # 3. Iterate over letters, for each letter, test its inclusion in the alphabet
  # 4. Map the letter to its left-shift or to itself
  # 5. Join the mapped array and return it
end

def encrypt(text)
  # create a key, and index every letter of the alphabet
  key = ('A'..'Z').to_a
  # split the text into a character array
  characters = text.chars
  # iterate through the text
  characters.map do |char|
    # key.index(char)
    # check if letter exists in key
    if key.include?(char)
      # move it back three
      index = key.index(char)
      key[index - 3]
    else
      # if it doesnt
      # leave it be
      char
    end
  end.join
  # join all the characters back again
end

# Make sure the objective is clear to everyone, go through and write the tests, use the team_count as an example for all of them
# Once psuedocode is done, everyone break off into teams and pair program for 5 min
# Work together through code, getting input from each team

# Once you've built that you'll need to build a variable encrypter that allows for shifts other than 3 letters as our enemies are always cracking our codes

def encrypt_variable(text, shift = 3)
  # create a key, and index every letter of the alphabet
  key = ('A'..'Z').to_a
  # split the text into a character array
  characters = text.chars
  # iterate through the text
  characters.map do |char|
    # key.index(char)
    # check if letter exists in key
    if key.include?(char)
      # move it back however many we need to shift
      index = key.index(char)
      key[(index - shift) % 26]
    else
      # if it doesnt
      # leave it be
      char
    end
  end.join
  # join all the characters back again
end

# Finally once you have the encryptor, you'll be able to build the decryptor tool to give you acccess to this message stolen from the interior US CIA to understand the crisis
# "TB'OB XZQRXIIV GRPQ OBXIIV ARJY XKA XZQRXIIV YBIFBSB TEXQ ZLJBP LRQ LC EFP JLRQE"

def decode(text)
  encrypt_variable(text, -3)
end

puts decode("TB'OB XZQRXIIV GRPQ OBXIIV ARJY XKA XZQRXIIV YBIFBSB TEXQ ZLJBP LRQ LC EFP JLRQE")


