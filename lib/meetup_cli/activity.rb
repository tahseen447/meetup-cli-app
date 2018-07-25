class MeetupCli::Activity
  attr_accessor :name, :tag_line, :location, :organiser, :total_members, :type_of_group, :about, :meetup, :url

  def initialize(name, tag_line)
    @name = name
    @tag_line = tag_line
  end

  def list_meetup
    #scrape the url for the details of this activity and fill all the intance attributes
    #add /events at the end to scrape the meetups
    # if /events gives no upcoming meetups set up the method upcoming? = false
    #create the meetup
    @location = "Alhambra, CA"
    @type_of_group = "Public"
    @organiser = "John L and 8 others"
    @total_members = "3871 members"
    @about = "Meet other people interested in backpacking, hiking, camping and skiing. Our signature hike is the Wednesday night hike up to Echo Mountain for a fun HAPPY HOUR potluck. Everyone is welcome, so come and help us make this the greatest group on meetup."
    @meetup = MeetupCli::Meetup.new
    @meetup.name = "Echo Mountain 534"
    @meetup.time_object = "Wednesday, July 25, 2018"
    @meetup.venue = "Cobb Estate, Lake Avenue at Loma Alta"
    @meetup.host = "Linus D."
    @meetup.about = "Please be advised - as a co-organizer of Happy Hour Backpacking and organizer of this hike, I am not soliciting funds."
    end

  def display_meetups
    list_meetup
    puts "#{@name}"
    puts "#{@location}"
    puts "#{@type_of_group}"
    puts "#{@organiser}"
    puts "#{@total_members}"
    puts "#{@about}"
    if @meetup.upcoming?
      @meetup.display
    else
      "Sorry no upcoming meetups!!"
    end
  end
end
