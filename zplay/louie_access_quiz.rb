class Component
  attr_accessor :name
end


class Thing
  
  variable   = Component.new   # looks like only accessable within this "block".  Not if you reopen the class.  I would guess only useful for metaprogramming.
  @variable  = Component.new   # Private to class
  @@variable = Component.new   # Accessable to class/subclasses/instances
  VARIABLE   = Component.new   # Accessable to class/subclasses/instances, Accessable anywhere if you reference Thing::VARIABLE
  $variable  = Component.new   # Global, accessable anywhere
  
  def self.action
    # What do I have access to here?
    puts "Thing, self.action, @variable=#{@variable}, @@variable=#{@@variable}, VARIABLE=#{VARIABLE}, $variable=#{$variable}"
  end
  
  def action
    # What do I have access to here?
    puts "thing instance, action, @@variable=#{@@variable}, VARIABLE=#{VARIABLE}, $variable=#{$variable}"
  end
  
  # What do I have access to here?
  puts "Thing, variable=#{variable}, @variable=#{@variable}, @@variable=#{@@variable}, VARIABLE=#{VARIABLE}, $variable=#{$variable}"
end

puts "Thing.action"
Thing.action

# What do I have access to here?
puts "Main, VARIABLE=#{Thing::VARIABLE}, $variable=#{$variable}"

thing = Thing.new
# What do I have access to using thing?
thing.action

class Thing
  
  # What do I have access to here?  (Re-opening Thing)
  puts "Thing, reopened, @variable=#{@variable}, @@variable=#{@@variable}, VARIABLE=#{VARIABLE}, $variable=#{$variable}"
  
end


class SubThing < Thing
  
  # What do I have access to here?
  puts "SubThing, @variable=#{@variable}, @@variable=#{@@variable}, VARIABLE=#{VARIABLE}, $variable=#{$variable}"

  def self.action
    # What do I have access to here?
    puts "SubThing, self.action, @variable=#{@variable}, @@variable=#{@@variable}, VARIABLE=#{VARIABLE}, $variable=#{$variable}"
  end
  
  def action
    # What do I have access to here?
    puts "subthing instance, action, @@variable=#{@@variable}, VARIABLE=#{VARIABLE}, $variable=#{$variable}"
  end
end
puts "SubThing.action"
SubThing.action
puts "subthing.action"
SubThing.new.action