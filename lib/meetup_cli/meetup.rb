class MeetupCli::Meetup
  attr_accessor :name, :url, :time_object, :venue, :host, :upcoming, :about, :attendees


  def display
    puts "#{@name}"
    puts "#{@about}"
    puts "#{@host}"
    puts "#{@time_object}"
    puts "#{@venue}"
    puts "#{@attendees}"
  end
end
