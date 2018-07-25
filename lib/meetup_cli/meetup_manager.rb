class MeetupCli::MeetupManager

  def self.categories
    #scrape the site and list activities
    categories= [MeetupCli::Category.new("arts", "http://meetup.com"), MeetupCli::Category.new("yoga", "http://meetup.com"), MeetupCli::Category.new("bollywood dance", "http://meetup.com")]
    categories
  end
end
