require 'nokogiri'
require 'open-uri'
require_relative '../recipe'

class ScrapeBBCGoodFood
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    html = open("https://www.bbcgoodfood.com/search/recipes?query=#{@keyword}").read
    doc = Nokogiri::HTML(html, nil, "utf-8")
    results = []
    doc.search(".node-recipe").first(5).each do |node|
      title = node.search(".teaser-item__title").text.strip
      description = node.search(".field-item").text.strip
      prep_time = node.search(".teaser-item__info-item--total-time").text.strip
      difficulty = node.search(".teaser-item__info-item--skill-level").text.strip
      results << Recipe.new(title, description, prep_time, difficulty)
    end
    results
  end
end
