require_relative "../scraper"

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

describe "#grab_movie_urls" do
  it "returns an array of movies" do
    urls = grab_movie_urls
    expected = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    expect(urls).to eq(expected)
  end
end

describe "#scrape_movie" do
  it "returns a hash with movie information when given a url" do
    the_dark_knight_url = "https://www.imdb.com/title/tt0468569/"
    movie_hash = scrape_movie(the_dark_knight_url)
    expected = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }
    expect(movie_hash).to eq(expected)
  end
end

