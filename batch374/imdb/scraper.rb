require 'open-uri'
require 'nokogiri'

def fetch_movie_urls
  top_movie_url = "https://www.imdb.com/chart/top"

  html_file = open(top_movie_url).read
  html_doc = Nokogiri::HTML(html_file)

  title_elements = html_doc.search(".titleColumn + a").first(5)

  title_elements.map do |element|
    "https://www.imdb.com#{element.values.first}"
  end
  puts something
  puts antoe
  asdfasdf
end

def scrape_movie(url)
end
