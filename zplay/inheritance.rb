# I have been thinking about the systems I used to write, and how I would use inheritance to solve problems (since I didn't have that option before).
# I think I would use inheritance to share behaviour for controllers, services, things like that.  The behavour I would share would be things like access to standard logging, or logging for API requests.  I guess the way Rails uses inheritance for Controllers & Models.
# We used to implement those sorts of things with the equivalent of "scaffolding", but it was smarter than Rails' scaffolding.  The scaffolding would generate nicely, but the generated code wouldn't change automatically.  Inheritance would probably be good for that, but I'm still not so sure, since we would have the scaffold generate calls to generic classes that could be changed.
# I guess my biggest confusion is with the use of inheritance in models...

# Online inheritance examples are often like this:

class Animal
  def initialize(name:)
    @name = name
  end
  
  def talk
    puts "My name is #{@name}.  I'm a #{self.class.name} and I say #{noise}!"
  end
  
  def noise # override me
    "???"
  end
end

class Cat < Animal
  def noise
    "meow"
  end
end

class Human < Animal
  def noise
    "hello"
  end
end

Cat.new('Kitty').talk # My name is Kitty.  I'm a Cat and I say meow!"

# to me, the above subclassing is like "hard-coding", and won't work great when you get 50+ types.  Also, assuming the Type class has more than just a "speak" attribute, I can't easily use queries to find similarities between types... I'd have to look at all the subclasses' code, which seems very inefficient to me.


# I would have designed it more like this:

class Type < ActiveRecord
  has_many :animals
  
  attr_accessor :id, :name, :noise
end  
# Table
# id  name   noise
#  1  Cat    meow
#  2  Dog    woof

class Animal < ActiveRecord
  belongs_to :type
  
  attr_accessor :id, :name, :type_id
  
  def initialize(name:, type:)
    @name    = name
    @type_id = Type.where(name: type).id
  end
  
  def talk
    puts "My name is #{name}.  I'm a #{type.name} and I say #{type.noise}!"
  end
end

Animal.new(name: "Bob", type: "Cat").talk  # My name is Bob. I'm a Cat and I say meow!"


# I didn't write that very well, or try to test it, but hopefully you get what I mean :)  So my question is, when would you use inheritance in models?




