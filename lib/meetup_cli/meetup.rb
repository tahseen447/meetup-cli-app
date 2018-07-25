class MeetupCli::Meetup
  attr_accessor :name, :url, :time_object, :venue, :host, :about

  def upcoming?
    return true
  end

  def display
    puts "#{@name}"
    puts "#{@host}"
    puts "#{@about}"
    puts "#{@time_object}"
    puts "#{@venue}"
  end
end
