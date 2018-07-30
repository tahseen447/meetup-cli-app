class MeetupCli::Meetup
  attr_accessor :name, :url, :time_object, :venue, :host, :upcoming, :about, :attendees


  def display
    puts "Upcoming Meetup in the Neighborhood"
    puts "#{@name}"
    puts "#{@host}"
    puts "#{@time_object}"
    puts "#{@venue}"
    puts "#{@attendees}"
    puts "#{@about}"
  end
end
