class MeetupCli::CLI

  def call
    list_categories
    menu
  end

  def list_categories
    puts "Welcome to Meetup!!"
    puts "Check out current Meetups in the Neighbourhood"
    MeetupCli::Scraper.categories
    @categories = MeetupCli::Category.all
    @categories.each_with_index {|val, index| puts "#{index+1}. #{val.name} - #{val.url}"}
    menu
  end


  def menu
    puts "Enter the category you are interested in or exit:"
    input = nil
      #puts "Enter the category you are interestedirb in or exit:"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < @categories.length
        # get the list of activities for that Category
        #scraper should get the url and scrape the details
        MeetupCli::Scraper.activities(@categories[input.to_i-1])
        @activities = MeetupCli::Activity.all
        puts "----------------------------------------------------------"
        puts "                                                          "
        puts "These are the activities going on in your Neighbourhood"
        puts "                                                           "
        puts "-----------------------------------------------------------"
        @activities.each_with_index {|val, index| puts "#{index+1}. #{val.name} | #{val.tag_line} | #{val.url}"}
        list_activities
      elsif  input == "list category"
          list_categories
        elsif input =="exit"
          exit_message
        else
          puts "Not sure what you want, type list category or exit"
        end
    end

    def list_activities
      #from the activities array thats now displayed
      puts "Enter the activities you are interested in or exit or go back "
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < @activities.size
        # get details of that activities-meetup requested
        @activities[input.to_i-1].display_meetups
        @activities.each_with_index {|val, index| puts "#{index+1}. #{val.name} | #{val.tag_line} | #{val.url}"}
        list_activities
      elsif  input == "list activities"
          list_activities
      elsif input =="exit"
          exit_message
        elsif input == "go back"
          list_categories
        else
          puts "Not sure what you want, type list activities or exit or go back"
        end
      end

    def exit_message
      puts "Enjoy your day!"
    end
end
