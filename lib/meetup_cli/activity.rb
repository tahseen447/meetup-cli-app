class MeetupCli::Activity
  attr_accessor :name, :tag_line, :location, :organiser, :total_members, :type_of_group, :about, :meetup, :url
  @@all =[]

  def initialize(name, url, tag_line)
    @name = name
    @url = url
    @tag_line = tag_line
    @@all << self
  end

  def list_meetup
    # scrape url/events gives no upcoming meetups set up the method upcoming? = false
    #create the meetup
    MeetupCli::Scraper.list_meetup(self)
    end

  def display_meetups
    list_meetup
    puts "Name: #{@name}"
    puts "Location: #{@location}"
    puts "Type of Group: #{@type_of_group}"
    puts "Organised by:#{@organiser}"
    puts "Total Member#{@total_members}"
    puts "About: #{@about}"
    if @meetup.upcoming
      @meetup.display
    else
      puts "----------------------------------"
      puts "Sorry no upcoming meetups!!"
      puts "----------------------------------"
    end
  end

  def self.all
    @@all
  end
end
