class Thing
  def self.say_hello
    puts "Hi"
  end
  puts "In Thing, self=#{self}"
end
Thing.say_hello

# BEFORE you run this...
# 1. what will self be?
# 2. what will print first, "Hi" or the "In thing..." string? 