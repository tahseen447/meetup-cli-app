class MeetupCli::Activity
  attr_accessor :name, :tag_line, :location, :organiser, :total_members, :type_of_group, :about, :meetup, :url

  def initialize(name, url, tag_line)
    @name = name
    @url = url
    @tag_line = tag_line
  end

  def list_meetup
    # scrape url/events gives no upcoming meetups set up the method upcoming? = false
    #create the meetup
    MeetupCli::Scraper.list_meetup(self)
    end

  def display_meetups
    list_meetup
    puts "#{@name}"
    puts "#{@location}"
    puts "#{@type_of_group}"
    puts "#{@organiser}"
    puts "#{@total_members}"
    puts "#{@about}"
    if @meetup.upcoming
      @meetup.display
    else
      puts "----------------------------------"
      puts "Sorry no upcoming meetups!!"
      puts "----------------------------------"
    end
  end
end
