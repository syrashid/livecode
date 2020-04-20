# 1) We need a function to scrape www.imdb.com/chart/top to get URLs
# 2) We need to loop over those URLs and pass it to another function which will scrape that specific movie page
# 3) We need to put the movie information into a Hash. Store all movies in an Array
# 4) Finally, convert the Array of movies into a YAML and write it to a file. (Where should this belong?)

require 'open-uri'
require 'yaml'
require_relative 'scraper'

yaml_array = fetch_movie_urls.collect { |url| scrape_movie(url) }

File.open('movie_info.yml', 'w') { |file| file.write(yaml_array.to_yaml) }

# Make sure that you can read this as well

puts YAML.load_file("movie_info.yml")
