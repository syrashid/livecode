def encrypt(text)
  # Build a key of alphabet letters
  keys = ('A'..'Z').to_a
  # Split into characters
  chars = text.chars
  # Iterate through the characters (map)
  chars.map do |char|
    # Check if the letter exists in our key
    if keys.include?(char)
      # If it does, convert it or change it
      index = keys.index(char)
      keys[index - 3]
    else
      # If it doesn't, keep it the same
      char
    end
  end.join

end

# Once you've built the above you'll need to build a variable encrypter that allows for shifts other than 3 letters as our enemies are always cracking our codes

def encrypt_variable(text, shift = 3)

    # Build a key of alphabet letters
  keys = ('A'..'Z').to_a
  # Split into characters
  chars = text.chars
  # Iterate through the characters (map)
  chars.map do |char|
    # Check if the letter exists in our key
    if keys.include?(char)
      # If it does, convert it or change it
      index = keys.index(char)
      keys[(index - shift) % 26]
    else
      # If it doesn't, keep it the same
      char
    end
  end.join
end

# Finally once you have the encryptor, you'll be able to build the decryptor tool to give you acccess to this message stolen from the interior US CIA to understand the crisis

# "TB'OB XZQRXIIV GRPQ OBXIIV ARJY XKA XZQRXIIV YBIFBSB TEXQ ZLJBP LRQ LC EFP JLRQE"

def decode(text)
  encrypt_variable(text, -3)
end

puts decode("TB'OB XZQRXIIV GRPQ OBXIIV ARJY XKA XZQRXIIV YBIFBSB TEXQ ZLJBP LRQ LC EFP JLRQE")


