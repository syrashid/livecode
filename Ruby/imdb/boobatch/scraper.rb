# Write a function to scrape the top 250 movies for urls X
# We want to loop over the urls, and scrape the respective page
# We should take the scraped information and put it into a hash
# Store the array of movie hashes into a yaml file

require 'nokogiri'
require 'open-uri'

TOP_250_URL = "https://www.imdb.com/chart/top"

def grab_movie_urls
  html_top_250 = URI.open(TOP_250_URL).read
  doc = Nokogiri::HTML(html_top_250)
  doc.search('.titleColumn a').first(5).map do |node|
    "https://www.imdb.com#{node.attributes["href"].value}"
  end
end


url = "https://www.imdb.com/title/tt0468569/"

def scrape_movie(url)
  html = URI.open(url).read
  doc = Nokogiri::HTML(html)

  title = doc.search('.title_wrapper h1').children[0].text.chop
  year = doc.search('.title_wrapper a').children.first.text
  storyline = doc.search('.summary_text').text.strip
  director = doc.search('.credit_summary_item a').first.text
  cast = doc.search('.primary_photo+td a').first(3).map do |actor|
    actor.text.strip
  end
end
