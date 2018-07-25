class MeetupCli::Activity
  attr_accessor :name, :tag_line, :location, :organiser, :total_members, :type_of_group, :about, :meetup

  def initialize(name, tag_line)
    @name = name
    @tag_line = tag_line
  end
end
