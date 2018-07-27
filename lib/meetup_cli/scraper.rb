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
    activity_elements = doc.css("a.groupCard--photo.loading.nametag-photo")
    activity_elements.each do |element|
      name =  element.css("h3.padding-none.inline-block.loading").text.strip
      url = element['href']
      tag_line = element.css("p.small.ellipsize").text.strip
      activity = MeetupCli::Activity.new(name, url, tag_line)
      activity_list << activity
    end
    activity_list
  end
end
