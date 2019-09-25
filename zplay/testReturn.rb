class TestReturn
  def method1
    arr = [1,2,3,4,5]
    arr.each do |x|
      puts "x=#{x}"
      next if x == 3
    end
    puts "after each"
  end
end

TestReturn.new.method1
