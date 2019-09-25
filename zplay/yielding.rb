class OneTwoThree

  def do_it(whatever)
    yield(whatever, 1)
    yield(whatever, 2)
    yield(whatever, 3)
  end
end

test = OneTwoThree.new
test.do_it("Howdy") do |y, x|
  puts "whatever=#{y}, param is #{x}"
end


myarr = [1,2,3,4,5]

myarr.each {|x| puts "array value=#{x}" }



  
  
  