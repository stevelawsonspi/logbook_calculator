$stdout.sync = true

class Thing

  @@things  = []      # Class variable:           available to all instances and subclasses
  @log      = []      # Class instance variable:  only available to the class (not instances and not subclasses)
  
  def initialize
    @stuff = 'stuff'  # Instance variable:        only available to the object and methods of subclasses
    
    @@things << self
    
    greeting
  end
  
  def self.things
    @log << caller[0]
    @@things
  end
  
  def greeting
    puts "Hi, I'm thing number #{@@things.index(self)},  #{@log.inspect}"
  end
  
  def things
    @@things
  end
  
  def log
    @log
  end
  
  def class_log
    self.class.log
  end
  
  def self.log
    @log
  end
  
  def self.stuff
    @stuff
  end
  
end

Thing.new                       # Outputs:  Hi, I'm thing number 0,  nil
Thing.new                       # Outputs:  Hi, I'm thing number 1,  nil
Thing.new                       # Outputs:  Hi, I'm thing number 2,  nil

puts Thing.things.count         # => 3

thing = Thing.things.last

puts thing.things.count         # => 3
puts thing.log.inspect          # => nil
puts thing.class_log.inspect    # => ["class_instance_variables.rb:52:in `<main>'", "class_instance_variables.rb:54:in `<main>'"]

class SubThing < Thing
  @log = []                     # Error follows if not defined.  Question: Why?  
                                # A: class instance variables are only availble in the class they are defined.
end

subthing = SubThing.new         # Outputs: Hi, I'm thing number 3,  nil

puts Thing.things.count         # => 4
puts SubThing.things.count      # => 4

puts Thing.log.count            # => 3
puts SubThing.log.count         # => 1

puts Thing.stuff.inspect        # => nil
puts SubThing.stuff.inspect     # => nil

# Question: Why is Thing.things.count == SubThing.things.count ?
# A: Class variables are shared with subclasses.  They are like global variables within a class hierarchy.
# Question: Why is Thing.log.count    != SubThing.log.count ?  
# A: The "log" method returns a class instance variable value, which is unique to each class.
# Question: How does SubThing.log.count get to be 1?
# A: the "things" method adds to the @log instance variable when used, and this variable is uniqie for each class.  Weird that the class method on Thing is modifying the instance variable in SubThing :)
# Exercise: Refactor the use of @@things so that it provides the same functionality and access but is not directly available by anything except the Thing class.

# Advanced question: How do you remove objects from @@thing when they're "gone"?