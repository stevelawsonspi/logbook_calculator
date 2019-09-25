class Thing

  NUMBER_OF_COMPONENTS = 4

  def generate
    process_stuff
  end
  
  private
  
  def process_stuff
    self.class::NUMBER_OF_COMPONENTS.times do |i|
      puts "processing component #{i} ..."
    end
  end

end


class SubThing < Thing

  NUMBER_OF_COMPONENTS = 8

end


puts "Thing::NUMBER_OF_COMPONENTS    = #{Thing::NUMBER_OF_COMPONENTS.inspect}"
puts "SubThing::NUMBER_OF_COMPONENTS = #{SubThing::NUMBER_OF_COMPONENTS.inspect}"

thing    = Thing.new
subthing = SubThing.new

puts "Generating #{Thing::NUMBER_OF_COMPONENTS} thing components ..."
thing.generate

puts "Generating #{SubThing::NUMBER_OF_COMPONENTS} subthing components ..."
subthing.generate

# Question: what does subthing.generate output? 0..3
# Question: what is wrong?  It's referrencing the constant in Thing, not SubThing
# Question: how can you fix it? use self.class::CONSTANT (as above)
# It seems that if a constant appears within a method, its value is evaluated for the class where that method is defined.
# Can't say that sounds logical to me, and I can't find any "official" Ruby documentation explaining that, or why it's like that. 
# I only found this info (and a solution) in a forum: https://www.ruby-forum.com/t/class-inheritance-and-class-constants/210683 
# Is there a good reason for this, or is this just a "gotcha" to be careful of?