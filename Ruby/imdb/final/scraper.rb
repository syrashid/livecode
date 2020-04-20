require 'open-uri'
require 'nokogiri'

def fetch_movie_urls
html_top_250 = open('https://www.imdb.com/chart/top').read
doc = Nokogiri::HTML(html_top_250)
doc.search('.titleColumn a').first(5).map { |movie_url| 'https://www.imdb.com' + movie_url['href'] }
end

def scrape_movie(url)
  doc = Nokogiri::HTML(open(url).read)
  {
    title: doc.css('.title_wrapper h1')[0].children[0].text.chop,
    year: doc.css('.title_wrapper a')[0].text.to_i,
    storyline: doc.css('.summary_text')[0].text.strip,
    director: doc.css("h4:contains('Director:') + a").text,
    cast: doc.search(".primary_photo + td").first(3).map { |node| node.text.strip }
  }
end
