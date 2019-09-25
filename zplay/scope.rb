class Thing
  def something
    'nothing'
  end
  
  def say
    puts "Something 1 = #{something}"
    something = 'everything'
    puts "Something 2 = #{something}"
    say_more(something)
  end
  
  def say_more(something)
    puts "Something 3 = #{something}"
  end
end

Thing.new.say

# output...
# Something 1 = nothing
# Something 2 = everything
# Something 3 = everything