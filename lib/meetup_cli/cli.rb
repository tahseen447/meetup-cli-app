class MeetupCli::CLI
    def call
    list_activities
    menu
    exit_message
  end

  def list_activities
    puts "Welcome to Meetup!!"
    @categories = MeetupCli::MeetupManager.categories
    @categories.each_with_index {|val, index| puts "#{index+1}. #{val.name}"}
  end

  def menu
    input = nil
    while input != "exit"
          puts "Enter the activity you are interested in or exit:"
          input = gets.strip.downcase
          binding.pry
          if input.to_i > 0
            # get the list of activities for that Category
            #scraper should get the url and scrape the details
            puts "#{input.to_i-1}"
            @activities = @categories[input.to_i].activities
            @activities.each_with_index {|val, index| puts "#{index+1}. #{val.name} #{val.tag_line}"}
          elsif  input == "list"
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
