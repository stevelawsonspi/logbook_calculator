class TestingInstanceVars
  def initialize
    @my_instance_var = "A"
  end
  
  def check
    puts "@my_instance_var=#{@my_instance_var}"
    #crashes puts "self.my_instance_var=#{self.my_instance_var}"
  end
end

test = TestingInstanceVars.new
test.check