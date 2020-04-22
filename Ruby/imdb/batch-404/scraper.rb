require 'open-uri'
require 'nokogiri'

#serialize data from the initial page
# collect all the urls for the top 5 movies
doc = Nokogiri::HTML(open('https://www.imdb.com/chart/top').read)
a_tags = doc.search('.titleColumn a').first(5)

urls = a_tags.collect do |element|
  'https://www.imdb.com' + element['href']
end


# iterate through the urls
movies_array = []
urls.each do |url|
  movie_hash = scrape_movie(url)
  movies_array << movie_hash
end

# scrape the page for the information we need
url = "https://www.imdb.com/title/tt0468569/"

def scrape_movie(url)
  movie_doc = Nokogiri::HTML(open(url).read)
  title = movie_doc.search('h1').children.first.text.chop
  year = movie_doc.search('#titleYear a').text
  storyline = movie_doc.search('.summary_text').text.strip
  director = movie_doc.search('.credit_summary_item').first.children[-2].text
  cast = movie_doc.search('.primary_photo + td').first.children[-2].text.strip
end


