class MeetupCli::Meetup
  attr_accessor :name, :url, :time_object, :venue, :host, :upcoming, :about, :attendees


  def display
    puts "----------------------------------------------------------"
    puts "Upcoming Meetup in the Neighborhood"
    puts "----------------------------------------------------------"
    puts "#{@name}"
    puts "#{@host}"
    puts "#{@time_object}"
    puts "#{@venue}"
    puts "--------------------------------------------------------------------------------------------------------------------------"
    puts "#{@attendees}"
    puts "#{@about}"
    puts "--------------------------------------------------------------------------------------------------------------------------"
  end
end
