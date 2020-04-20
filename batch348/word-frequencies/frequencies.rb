def frequencies(text)
  freq_hash = Hash.new(0)
  # Slightly different implementation to how we solved it today, here we cleaned up the code a little by creating a new hash using it's class, and instantiating a new one with a default value of 0.  We'll cover this next week in objects but I just wanted to show a quick way on how we could clean up our code.  By doing this, we removed our if else statment in our iterator because the default value for any new key value pair will be 0, so instead of having to do the if else statement it reduces to a single line.
  text.split(/\s+/).each do |word|
    freq_hash[word.strip.downcase] += 1
  end
  freq_hash
end

