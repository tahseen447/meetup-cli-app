require 'nokogiri'
require 'open-uri'
class MeetupCli::Scraper

  def self.categories
    #scrape the site and list activities
    category_list = []
    doc = Nokogiri::HTML(open("https://www.meetup.com/"))
    category_elements = doc.css(".exploreHome-categories-card")
    category_elements.each do |element|
      url = element.css("a")[0]['href']
      name = element.css("h4").text
      category = MeetupCli::Category.new(name, url)
      category_list << category
    end
    category_list
  end

  def self.activities(category)
    url = category.url
    activity_list = []
    doc = Nokogiri::HTML(open(url))
    activity_elements = doc.css("li.groupCard.tileGrid-tile")
    binding.pry
    #category_elements = doc.css(".exploreHome-categories-card")
    #category_elements.each do |element|
    #  url = element.css("a")[0]['href']
    #  name = element.css("h4").text
    #  category = MeetupCli::Category.new(name, url)
    #  category_list << category
  #end
    activity_list
  end
end
