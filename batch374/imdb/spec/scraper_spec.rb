# Top 5 Movies from Top 250
[
  "https://www.imdb.com/title/tt0111161/",
  "https://www.imdb.com/title/tt0068646/",
  "https://www.imdb.com/title/tt0071562/",
  "https://www.imdb.com/title/tt0468569/",
  "https://www.imdb.com/title/tt0050083/"
]

# Test Movie hash with correct information
{
  cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
  director: "Christopher Nolan",
  storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
  title: "The Dark Knight",
  year: 2008
}

require_relative '../scraper'

describe "fetch_movie_urls" do
  it "should fetch an array of string urls" do
    expected = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    actual = fetch_movie_urls
    expect(actual).to eq(expected)
  end
end

describe "scrape_movie" do
  it "should return all the movie info in a hash" do
    expected = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }
    actual = scrape_movie("https://www.imdb.com/title/tt0468569/")
    expect(actual).to eq(expected)
  end
end
