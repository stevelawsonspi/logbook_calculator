class Nav
  def initialize
    @tabletop = Tabletop.new
    @robot1   = Robot.new(@tabletop)
    @robot2   = Robot.new(@tabletop)
    @robot3   = Robot.new(@tabletop)
    @robot1.num = 1
    @robot2.num = 2
    @robot3.num = 3
  end
 
  def show_robots_on_tabletop
    puts "@robot1.object_id=#{@robot1.object_id}, @robot2.object_id=#{@robot2.object_id}, @robot3.object_id=#{@robot3.object_id}"
    @tabletop.show_robots
  end
  
  def robot1_num(num); @robot1.num = num; end
  def robot2_num(num); @robot2.num = num; end
  def robot3_num(num); @robot3.num = num; end

  def robot1_other_nums; @robot1.other_nums; end
  def robot2_other_nums; @robot2.other_nums; end
  def robot3_other_nums; @robot3.other_nums; end
end

class Tabletop
  def add(robot)
    robots << robot
  end

  def robots
    @robots ||= []
  end
  
  def nums_other_than(skip_robot)
    @robots.select{|robot| robot.object_id != skip_robot.object_id}.map(&:num)
  end
  
  def show_robots
    @robots.each {|robot| puts "robot.object_id=#{robot.object_id}, robot.num=#{robot.num}" }
  end
end

class Robot
  attr_accessor :num

  def initialize(tabletop)
    @tabletop = tabletop
    @tabletop.add(self)
  end

  def other_nums
    puts "I'm object_id=#{object_id} num=#{num}, @tabletop.nums_other_than(self)=#{@tabletop.nums_other_than(self)}"
  end
end

nav = Nav.new
puts "nav.robot1.other_nums=#{nav.robot1_other_nums}"
nav.show_robots_on_tabletop
nav.robot1_num(10)
nav.robot2_num(20)
nav.robot3_num(30)
puts "nav.robot2.other_nums=#{nav.robot2_other_nums}"
nav.show_robots_on_tabletop
nav.robot1_num(100)
nav.robot2_num(200)
nav.robot3_num(300)
puts "nav.robot3.other_nums=#{nav.robot3_other_nums}"
puts "nav.robot1.other_nums=#{nav.robot1_other_nums}"
nav.show_robots_on_tabletop


