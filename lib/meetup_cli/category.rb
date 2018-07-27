class MeetupCli::Category
  attr_accessor :name, :url

  def initialize(name, url)
    @name = name
    @url = url
  end


  def activities
    #array of all activities in the area based on the category
    #scrape the url to get all the activities
    #create Activiy objects and fill in the array
    activities_array =MeetupCli::Scraper.activities(self)
    activities_array
  end
end
