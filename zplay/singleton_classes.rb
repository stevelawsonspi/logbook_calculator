module ModA
  def mmeth
    puts "in ModA, mmeth"
  end
end

class ClassA
  
  @class_instance_var = "class instance var in ClassA"
  
  def ClassA.cmethaonly
    puts "in ClassA, cmethaonly @class_instance_var=#{@class_instance_var}"
  end
  
  def self.cmetha
    puts "in ClassA, cmetha"
  end
  
  def imetha
    puts "in ClassA, imetha"
  end
end

class ClassB < ClassA
  include ModA
  
  # @class_instance_var = "class instance var in ClassB"
  
  def self.cmethb
    puts "in ClassB, cmethb"
  end
  
  def imethb
    puts "in ClassB, imethb"
  end
end

puts ClassB.method(:cmetha).owner
puts ClassB.method(:cmethb).owner
puts ClassA.method(:cmethaonly).owner
puts ClassB.method(:cmethaonly).owner
ClassA.cmethaonly
ClassB.cmethaonly


obj = ClassB.new

puts obj.method(:imetha).owner
puts obj.method(:imethb).owner
puts obj.method(:mmeth).owner

class << obj
  def hi
    puts "In Hi"
  end
end

puts obj.method(:hi).owner

def obj.hello
  puts "In Hello"
end

puts obj.method(:hello).owner



