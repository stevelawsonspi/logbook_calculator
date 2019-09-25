class Class1

  def Class1.cmeth1only
    puts "Class 1 cmeth1only"
  end

  def self.cmeth
    puts "Class 1 cmeth"
  end
  
  def meth
    puts "Class 1 meth"
  end
end

module Mod1
  
  module ClassMethods  
    def cmeth
      puts "Module 1 cmeth"
    end
  
    def mmeth
      puts "Module 1 mmeth"
    end
  end
  
  def meth
    puts "Module 1 meth"
  end
end  

class Class2 < Class1
  #class << self
    extend  Mod1::ClassMethods
  #end
  prepend Mod1 # include puts methods after the class, prepend puts them before the class

  def self.cmeth
    puts "Class 2 cmeth"
  end
  
  def meth
    puts "Class 2 meth"
  end
  
  def bmeth ()
    puts "Hi"
  end
end


Class2.cmeth
Class2.mmeth
x = Class2.new
x.meth

module Mod1
  def meth
    puts "Module 1 meth x"
  end
end 

puts "===="
Class2.cmeth
Class2.mmeth
x.meth
