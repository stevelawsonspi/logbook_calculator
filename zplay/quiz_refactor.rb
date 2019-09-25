$stdout.sync = true

class Thing

  @things  = []      # Class instance variable:  only available to the class (not instances and not subclasses)
  @log     = []      # Class instance variable:  only available to the class (not instances and not subclasses)
  
  def self.allthings
    @things
  end
  
  def initialize
    @stuff = 'stuff'  # Instance variable:        only available to the object and methods of subclasses
    
    Thing.allthings << self
    
    greeting
  end
  
  def self.things
    @log << caller[0]
    Thing.allthings
  end
  
  def greeting
    puts "Hi, I'm thing number #{Thing.allthings.index(self)},  #{@log.inspect}"
  end
  
  def things
    Thing.allthings
  end
  
  def log
    @log
  end
  
  def class_log
    self.class.log
  end
  
  def remove
    Thing.allthings.reject!{ |t| t == self }
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

puts "Count before remove = #{Thing.allthings.count}"  # => 4
thing.remove
puts "Count after remove  = #{Thing.allthings.count}"  # => 3

# Question: Why is Thing.things.count == SubThing.things.count ?
# A: Class variables are shared with subclasses.  They are like global variables within a class hierarchy.
# Question: Why is Thing.log.count    != SubThing.log.count ?  
# A: The "log" method returns a class instance variable value, which is unique to each class.
# Question: How does SubThing.log.count get to be 1?
# A: the "things" method adds to the @log instance variable when used, and this variable is uniqie for each class.  Weird that the class method on Thing is modifying the instance variable in SubThing :)
# Exercise: Refactor the use of @@things so that it provides the same functionality and access but is not directly available by anything except the Thing class.
# A: I set @@things to be an class instance variable, and then created a "getter" method that only lives in Thing... Thing.allthings
#    Not the most beautiful solution, but it keeps the program working as before.
# Advanced question: How do you remove objects from @@thing when they're "gone"?
# A: implemented "remove" mehtod