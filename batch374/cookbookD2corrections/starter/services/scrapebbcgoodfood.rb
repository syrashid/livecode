# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require_relative '../recipe'

class ScrapeBBCGoodFood
  def initialize(keyword)
    # we pass the keyword we want to look for to the constructor
    @keyword = keyword
  end

  # this should scrape the top 5 recipes and nothing moree
  def call
    # open the correct url with keyword and parse into Nokogiri file
    file = open("https://www.bbcgoodfood.com/search/recipes?query=#{@keyword}").read
    doc = Nokogiri::HTML(file, nil, 'utf-8')

    # Search the html and get top 5 results, return the information for these in a recipe object
    recipes = []
    doc.search('.node-recipe').first(5).each do |node|
      title = node.search('.teaser-item__title').text.strip
      description = node.search('.field-item').text.strip
      prep_time = node.search('.teaser-item__info-item--total-time').text.strip
      difficulty = node.search('.teaser-item__info-item--skill-level').text.strip
      recipes << Recipe.new(title, description, prep_time, false, difficulty)
    end

    recipes
  end
end
