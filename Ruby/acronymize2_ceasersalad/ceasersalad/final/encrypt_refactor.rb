# Here is the code refactored from today, while we do emphasize trying to
# refactor as much as you can, remember there is a limit when you can easily go
# overboard.  Below the three methods is my example of encrypt but over refactored


def encrypt(text)
  key = ("A".."Z").to_a

  text.chars.map do |let|
    index = key.index(let)
    key.include?(let) ? key[index - 3] : let
  end.join
end

def encrypt_variable(text, shift = -3)
  key = ("A".."Z").to_a

  text.chars.map do |let|
    index = key.index(let)
    key.include?(let) ? key[(index + shift) % 26] : let
  end.join
end

def decoder
  encrypt_variable(text, 3)
end

# The below is annoyingly refactored, like who in their living mind could just
# go back and read the below and actually understand it.  It's annoying.
# Remember as a developer you won't just be coding for yourself, your code may be
# seen long after you leave a role or company.  Therefore, one of the biggest
# differentiators between a good developer and a rotten one is how clean you can
# make your code.
# Thanks so much for listening today!!!!!


def encrypt(text)
  key = ("A".."Z").to_a
  text.chars.map { |let| key.index(let) ? key[key.index(let) - 3] : let }.join
end
