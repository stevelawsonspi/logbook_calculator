class SettersAndGetters
  def initialize
    @var = "0"
  end
  
  def var=(val)
    @var = val
  end
  
  def var
    @var
  end

  def test
    puts "1. var=#{var}, self.var=#{self.var}"
    var = "1"
    puts "2. var=#{var}, self.var=#{self.var}"
    self.var = "2"
    puts "3. var=#{var}, self.var=#{self.var}"
  end
end

x = SettersAndGetters.new
x.test