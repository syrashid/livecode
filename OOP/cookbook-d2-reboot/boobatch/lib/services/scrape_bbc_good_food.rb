require 'nokogiri'
require 'open-uri'
require_relative '../recipe'

class ScrapeBbcGoodFood
  def self.call(keyword)
    url = "https://www.bbcgoodfood.com/search/recipes?query=#{keyword}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    # 3. Parse the HTML document to extract the first 5 recipes suggested and store them in an Array
    recipes = doc.search('.node-recipe').first(5).collect do |node|
      attr = {
        name: node.search('.teaser-item__title').text.strip,
        description: node.search('.field-item').text.strip,
        prep_time: node.search('.teaser-item__info-item--total-time').text.strip,
        difficulty: node.search('.teaser-item__info-item--skill-level').text.strip
      }
      Recipe.new(attr)
    end
  end
end
