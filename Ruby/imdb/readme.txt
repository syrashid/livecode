>> CONTEXT <<<

# Start with the Dark Knight Rises Theme Song playing
# https://www.youtube.com/watch?v=iGx5a1ifSDs

# Today everyone your challenge is the following, we're finally entering the real world of being hackers, and we want to scrape all of the top 5 films on the IMDB top chart and dump this information into a movies.yml file for a client later.

# The IMDB top movies can be found below:
# https://www.imdb.com/chart/top

# Before we start any problem what should be the first thing we're thinking about?

>> PSUEDOCODE <<
What are the biggest steps we need, can we break them down further

>> TESTING <<
Let's think about the two main components here we need to test

>> IMPORTANT TOPICS FOR SY TO COVER <<
1) Playing with YAML files (https://medium.com/@kristenfletcherwilde/saving-retrieving-data-with-a-yaml-file-in-ruby-the-basics-e45232903d94), it's YAML Ain't A Markup Language (recursive acryonym, similar to PHP), human-readable data structure
2) Navigating an html doc with Nokogiri (https://learn.co/lessons/scraping-reading)
3) Understanding how to use the Chrome DevTools, extremely powerful for when we explore JS and CSS, but for now we're more concerned with it's ability to let us inspect things
4) Separation of Concerns - and why this is important, keep the end in mind
5) Combinators and the three types we need to know (descendant, child, adjacent) (SEND ARTICLE ON THIS)

>> WHAT WE ALREADY HAVE <<
1) YAML example file
2) interface file
3) spec folder structure
4) scraper file
