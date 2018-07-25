class MeetupCli::CLI
    def call
    list_activities
    menu
    exit_message
  end

  def list_activities
    puts "Welcome to Meetup!!"
    #scrape the site and list activities
    activities_array = ["arts", "yoga", "bollywood dance"]
    activities_array.each_with_index {|val, index| puts "#{index+1}. #{val}"}
  end

  def menu
    input = nil
    while input != "exit"
          puts "Enter the activity you are interested in or exit:"
          input = gets.strip.downcase
      case input
        when "1"
          puts "Arts - redondo beach july 30"
        when "2"
          puts "Yoga - manhattan beach july 28"
        when "3"
          puts "bollywood dance - torrance july 27"
        when "list"
          list_activities
        else
          puts "Not sure what you want, type list or exit"
        end
      end
    end


      def exit_message
        puts "Enjoy your day!"
      end
end
