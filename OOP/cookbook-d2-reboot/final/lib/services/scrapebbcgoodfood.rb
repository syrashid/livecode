require 'nokogiri'
require 'open-uri'
require_relative '../recipe'

class ScrapeBBCGoodFood
  def call(keyword)
    html = open("https://www.bbcgoodfood.com/search/recipes?query=#{@keyword}").read
    doc = Nokogiri::HTML(html, nil, "utf-8")
    results = []
    doc.search(".node-recipe").first(5).each do |node|
      attr = {}
      attr[:name] = node.search(".teaser-item__title").text.strip
      attr[:description] = node.search(".field-item").text.strip
      attr[:prep_time] = node.search(".teaser-item__info-item--total-time").text.strip
      attr[:difficulty] = node.search(".teaser-item__info-item--skill-level").text.strip
      results << Recipe.new(attr)
    end
    results
  end
end
