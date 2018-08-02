class MeetupCli::Meetup
  attr_accessor :name, :url, :time_object, :venue, :host, :upcoming, :about, :attendees


  def display
    puts "----------------------------------------------------------"
    puts "Upcoming Meetup in the Neighborhood"
    puts "----------------------------------------------------------"
    puts "Name: #{@name}"
    puts "Hosted By: #{@host}"
    puts "Time: #{@time_object}"
    puts "Venue: #{@venue}"
    puts "--------------------------------------------------------------------------------------------------------------------------"
    puts "#{@attendees}"
    puts "#{@about}"
    puts "--------------------------------------------------------------------------------------------------------------------------"
  end
end
