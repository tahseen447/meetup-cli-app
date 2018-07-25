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
    activities_array = [MeetupCli::Activity.new("So cal Happy hour backpacking", "we're 3871 Happy Hour Back Packers"), MeetupCli::Activity.new("Eastside Bike Club", "We're 336 Eastside bike club members!!")]
    activities_array
  end
end
