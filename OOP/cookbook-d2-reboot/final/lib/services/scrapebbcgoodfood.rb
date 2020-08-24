require 'nokogiri'
require 'watir'
require_relative '../recipe'

class ScrapeBBCGoodFood
  def self.call(keyword)
    # Set up watir, wait until page contents that are needed are fully loaded

    # Leave the below line as is if you don't want a browser window to open
    browser = Watir::Browser.new :chrome, headless: true
    # Comment in the below line, and comment out the above line if you want to see a browser window pop up
    # browser = Watir::Browser.new
    browser.goto "https://www.bbcgoodfood.com/search/recipes?q=#{keyword}"  # The url has changed slightly

    # This line is important because it is waiting for the elements we need to load before translating the html
    browser.element(class: "standard-card-new__additional-info-item").wait_until(&:present?)

    # Translate html into nokogiri doc
    doc = Nokogiri::HTML.parse(browser.html, nil, "utf-8")

    # Comment in the below line to close the browser window once the page contents have loaded
    # browser.close

    # The classes in bbcgoodfood have changed as well for the different elements
    doc.search(".standard-card-new").first(5).collect do |node|
      attr = {}
      attr[:name] = node.search(".standard-card-new__article-title").text.strip
      attr[:description] = node.search(".standard-card-new__description").text.strip
      attr[:prep_time] = node.search(".standard-card-new__additional-info-item")[0].text.strip
      attr[:difficulty] = node.search(".standard-card-new__additional-info-item")[1].text.strip
      Recipe.new(attr)
    end
  end
end
