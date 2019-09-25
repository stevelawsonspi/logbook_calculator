class Thing

  attr_accessor :a

  def initialize(a: ax, b: bx)
    @b = b
  end

  def do_something
    puts "a=#{a}, b=#{@b}"
  end
end

t = Thing.new(a: 'Hi', b: 'there')
t.do_something