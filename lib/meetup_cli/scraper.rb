require 'nokogiri'
require 'open-uri'

require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {js_errors: false})
end

class MeetupCli::Scraper

  def self.categories
    #scrape the site and list activities
    doc = Nokogiri::HTML(open("https://www.meetup.com/"))
    category_elements = doc.css(".exploreHome-categories-card")
    category_elements.each do |element|
      url = element.css("a")[0]['href']
      name = element.css("h4").text
      category = MeetupCli::Category.new(name, url)
    end

  end

  def self.activities(category)
    url = category.url
    doc = Nokogiri::HTML(open(url))
    activity_elements = doc.css("a.groupCard--photo.loading.nametag-photo")
    activity_elements.each do |element|
      name =  element.css("h3.padding-none.inline-block.loading").text.strip
      url = element['href']
      tag_line = element.css("p.small.ellipsize").text.strip
      activity = MeetupCli::Activity.new(name, url, tag_line)
    end
  end

  def self.list_meetup(activity)
    url = activity.url
    doc = Nokogiri::HTML(open(url))
    activity.about = doc.css("div.group-description.runningText").css("p").text
    activity.organiser = doc.css("span.text--bold.text--small")[0].text
    #others = doc.css("p.orgInfo-otherLeadership.display--inline.text--small")[0].text
    #[activity.organiser, others].join(' ')
    activity.location = doc.css("ul.inlineblockList.inlineblockList--separated").css("span")[0].text
    activity.total_members = doc.css("ul.inlineblockList.inlineblockList--separated").css("span")[1].text
    activity.type_of_group = doc.css("ul.inlineblockList.inlineblockList--separated").css("span")[2].text

    meetup = MeetupCli::Meetup.new
    #use poltergiest to extract java script data from website
    new_url = [url, "events"].join
    session = Capybara::Session.new(:poltergeist)
    session.visit(new_url)
    #check if it has upcoming meetups
    upcoming = false
    begin
      session.first(".emptyEventCard").text
    rescue
      Capybara::ExpectationNotMet
      upcoming = true
    end
    if upcoming == true
      begin
      meetup.name = session.first(".eventCardHead--title")['innerHTML']
      meetup.time_object = session.first(".eventTimeDisplay-startDate span")['innerHTML']
      meetup.venue = session.first(".venueDisplay").text
      meetup.host = session.first(".text--secondary.text--tiny").text
      meetup.about =session.first(".eventCard--MainContent div").text
      meetup.attendees =session.first(".avatarRow--attendingCount").text
      meetup.upcoming = upcoming
    rescue
      Capybara::ExpectationNotMet
    end
    else
       meetup.upcoming = upcoming
    end
      activity.meetup = meetup
    end
  end
