class DefaultValues
  
  def the_default
    'default'
  end
  
  def check(value = the_default)
    puts "value is #{value}"
  end
end

x = DefaultValues.new
x.check
x.check('some value')