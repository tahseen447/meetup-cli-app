class MeetupCli::Meetup
  attr_accessor :name, :url, :time_object, :venue, :host, :upcoming, :about


  def display
    puts "#{@name}"
    puts "#{@about}"
    puts "#{@host}"
    puts "#{@time_object}"
    puts "#{@venue}"
  end
end
