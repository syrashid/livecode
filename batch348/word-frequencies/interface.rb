require_relative 'frequencies'

data = File.read("texts/lorem.txt")

#Misquoted in lecture, I said Single Responsibility Principle, but what I meant to say was separation of concerns (SOC).  Similar end results, slightly different applications.  Important thing here is to remember that SOC is all about applications being split in to modules whose functionalities overlap as little as possible
word_hash = frequencies(data)

File.open("texts/stop_words.txt", "r").each_line { |word| word_hash.delete(word) }

# Heavy use of chaining here, make sure you take the time to understand what is being returned after each expression, and be mindful of the next method you chain on to it
puts word_hash.sort_by { |_key, value| -value }.first(50).to_h

# Be playing It's You by Ali Gatie at start
# https://www.youtube.com/watch?v=PXGycbkbtW0

# Take a brief second to talk about the Ballmer Peak
# https://xkcd.com/323/
# Practicality is what matters above else

# Guys it's summer, which can mean only one thing.  I'm ready to be hurt again, and the absolute easiest way to do that?  Easy... just gonna hop on tinder and get absolutely devasted, but before I can do that, I need to improve the quality of my messages.  So let's figure out what I've been saying to the lady folk, and fingers crossed not get fired for showing you something inappropriate.

# Today we're going to be building a word frequency calculator, essentially, we'll take in some text and see the frequencies of each word in that text with our latest favorite data structure we learned about.... HASHES!!!!!!!!

# Once everyone understands the objective, let's make sure we all can pseudocode together and figure out exactly what we want to do

# PSUEDO CODE

# The Two Big Components
# 1) Take in a string and break it down into word frequencies
    # Split the text into words
    # Increment by one when the word exists as a key
    # Return the hash

# 2) Take in a file path and return content of file as a big string
    # Read in thhe file
    # Apply our frequencies method
    # Clean the hash of the stop words
    # sort our hash by the most used words
    # take the first however many, convert to hash
    # print the clean hash

# Once we have the psuedo code, let's make sure we follow TDD practices and build some tests!

# Got them red, good.  Now let's build our frequency tracker in a separate file

# Got us to be able to read in a text and get frequencies?  Now let's make sure we can actually get the words from any txt document
