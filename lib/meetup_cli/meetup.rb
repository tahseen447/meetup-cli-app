class MeetupCli::Meetup
  attr_accessor :name, :url, :time_object, :venue, :host, :upcoming


  def display
    puts "#{@name}"
    puts "#{@host}"
    puts "#{@time_object}"
    puts "#{@venue}"
  end
end
