require 'time'  # requires should be at the top of the file, not inside a class

class GreetingObject # Not such a good class name, I would suggest calling it GreetingMachine

  def initialize 
  @current_time = Time.now
  @display_time = @current_time.strftime('%H:%M')
  end

  def greeting
    case @current_time.hour
    when 1..11
      puts "Goodmorning, it's #{@display_time}" 
    when 12..14
      puts "Have a nice lunch, It's #{@display_time}" 
    when 15..17
      puts "Good afternoon, Its #{@display_time}" 
    when 17..24
      puts "Goodnight, it's #{@display_time}" 
    end  
  end
end

GreetingMachine = GreetingObject.new  # variables should be snake case, like... greeting_machine = GreetingMachine.new 
GreetingMachine.greeting

# otherwise quite good.  
# I would suggest changing it so you pass the Time to GreetingMachine, like GreetingMachine.new(Time.now), then you can try passing in different times so you can test each time of day.