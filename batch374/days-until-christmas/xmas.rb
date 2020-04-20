puts "You've just run your ruby program"

# The challenge for all of you.  I am an absolutely terrible friend.  I always want to buy christmas gifts for my friends but I always forget to buy them on time.  And by the time I remember, it's far too late to buy presents.  What can I do?

# If only way I could create a counter that would tell me the number of days until Christmas.  As burgeoning ruby developers you guys can help me!

# First thing's first, let's write some psuedocode!

require 'date'

def days_before_christmas(anydate = Date.today)
  xmas_date = Date.new(2020, 12, 25)
# Date is before the 25th do this

  xmas_date = xmas_date.next_year if ( anydate >= xmas_date)

  (xmas_date - anydate).to_i
end

puts days_before_christmas().is_a? Integer
puts days_before_christmas() == 337
puts days_before_christmas(Date.new(2020, 12, 26)) == 364

# Afterwards, let's talk about TDD, rake, and write tests for our own
# Finally let's write the damn code


if (condition1)
  # do these things
elsif (condition2)
  # do these things
elsif (condition3)
  # do these things
else
  # catch anything else
end


# IMPORTANT TOPICS TO COVER
# - RubyDoc x
# - If Statements x
# - Refactoring Code x
# - Implicit Return x
# - Running code from the terminal x
# - Writing psuedocode x
# - TDD Test Driven Development x


