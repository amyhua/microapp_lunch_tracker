# make a micro-app of what you have for lunch each day


class LunchTracker
  def track_todays_lunch
    today = Time.new
    date = today.month.to_s + "/" + today.day.to_s + "/" + today.year.to_s
    print "What did you drink for lunch today? "
    drink = gets.chomp.to_s
    print "What did you eat for lunch today? "
    dish = gets.chomp.to_s
    print "How many calories did you consume during lunch today? "
    calories = gets.chomp.to_s

    Lunch.new(date,drink,dish,calories)
    puts "Your lunch has been tracked"
  end
  
  def track_past_lunch
    print "What date did you have this lunch? (MM/DD/YYYY format) "
    date = gets.chomp.to_s
    print "What did you drink for lunch today? "
    drink = gets.chomp.to_s
    print "What did you eat for lunch today? "
    dish = gets.chomp.to_s
    print "How many calories did you consume during lunch today? "
    calories = gets.chomp.to_s

    Lunch.new(date,drink,dish,calories)
    puts "Your lunch has been tracked"
  end
  

  def get_all_lunches
    puts "** Here is a record of all your tracked lunches **"
    ObjectSpace.each_object(Lunch) do |lunch|
      puts "On #{lunch.date}, you drank #{lunch.drink}, ate #{lunch.dish}, and consumed #{lunch.calories} calories total."      
    end
  end
  
  def get_past_lunch(date)
    ObjectSpace.each_object(Lunch) do |lunch|
      if lunch.date = date
        puts "On #{date}, you drank #{lunch.drink}, ate #{lunch.dish}, and consumed #{lunch.calories} calories total."
      end
    end
  end

end


class Lunch
  attr_accessor :date
  attr_accessor :drink
  attr_accessor :dish
  attr_accessor :calories
  
  def initialize(date,drink, dish,calories)
    @date = date
    @drink = drink
    @dish = dish
    @calories = calories
  end
end

tracker = LunchTracker.new

puts "** Track today's lunch **"
tracker.track_todays_lunch
puts "** Track a past lunch **"
tracker.track_past_lunch
tracker.get_all_lunches

