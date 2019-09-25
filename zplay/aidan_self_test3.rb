class Thing
  
  puts "1. Thing's instance methods are #{self.instance_methods(false)}"
  
  attr_accessor :name
  
  puts "2. Thing's instance methods are #{self.instance_methods(false)}"
  
  def say_hello
    puts "Hi, self=#{self}"
  end
  
  puts "3. Thing's instance methods are #{self.instance_methods(false)}"
  
end

# BEFORE you run this...
# 1. what will Thing's instance methods be at the 3 different puts?
