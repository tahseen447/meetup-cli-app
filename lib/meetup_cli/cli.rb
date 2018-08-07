class MeetupCli::CLI

  def call
    list_categories
    menu
    list_activities
    exit_message
  end

  def list_categories
    puts "Welcome to Meetup!!"
    puts "Enter the category you are interested in or exit:"
    MeetupCli::Scraper.categories
    @categories = MeetupCli::Category.all
    @categories.each_with_index {|val, index| puts "#{index+1}. #{val.name} - #{val.url}"}
  end


  def menu
    input = nil
      #puts "Enter the category you are interestedirb in or exit:"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < @categories.length
        # get the list of activities for that Category
        #scraper should get the url and scrape the details
        @activities = @categories[input.to_i-1].activities
        @activities.each_with_index {|val, index| puts "#{index+1}. #{val.name} | #{val.tag_line} | #{val.url}"}
        elsif  input == "list"
          list_categories
        else
          puts "Not sure what you want, type list or exit"
        end
    end

    def list_activities
      #from the activities array thats now displayed
      puts "Enter the activities you are interested in or exit:"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < @activities.size
        # get details of that activities-meetup requested
        @activities[input.to_i-1].display_meetups
        elsif  input == "list"
          list_activities
        else
          puts "Not sure what you want, type list or exit"
        end
      end

    def exit_message
      puts "Enjoy your day!"
    end
end
