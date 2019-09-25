class Thing
  def self.say_hello
    puts "Hi, self=#{self}"
  end
end

class SubThing < Thing
end

Thing.say_hello
SubThing.say_hello
  
  
# BEFORE you run this...
# 1. what will self be in Thing's say_hello vs SubThing's say_hello?
