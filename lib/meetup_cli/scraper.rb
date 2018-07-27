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

  def self.list_meetup(activity)
    url = activity.url
    doc = Nokogiri::HTML(open(url))
    activity.about = doc.css("div.group-description.runningText").css("p").text
    activity.organiser = doc.css("span.text--bold.text--small")[0].text
    others = doc.css("p.orgInfo-otherLeadership.display--inline.text--small")[0].text
    [activity.organiser, others].join(' ')
    activity.location = doc.css("ul.inlineblockList.inlineblockList--separated").css("span")[0].text
    activity.total_members = doc.css("ul.inlineblockList.inlineblockList--separated").css("span")[1].text
    activity.type_of_group = doc.css("ul.inlineblockList.inlineblockList--separated").css("span")[2].text

    meetup = MeetupCli::Meetup.new
    meetup_doc = Nokogiri::HTML(open(new_url = [url, "events"].join))
  #  written = File.write('./meeup.html', meetup_doc)
    #check if it has upcoming meetups
    span_elements = meetup_doc.css("span").select {|i| i.text == "No upcoming Meetups"}
    if span_elements.size == 0
      binding.pry
      meetup.name = "Echo Mountain 534"
      meetup.time_object = "Wednesday, July 25, 2018"
      meetup.venue = "Cobb Estate, Lake Avenue at Loma Alta"
      meetup.host = "Linus D."
      meetup.about = "something"
      else
        meetup.upcoming = false
      end
      binding.pry
      activity.meetup = meetup
    end
  end
#flex.flex--column.atMedium_flex--row.eventCard--long
