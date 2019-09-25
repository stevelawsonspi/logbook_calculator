class Thing
  
  @@class_var = "defined in Thing"
  @class_instance_var = 'defined in thing'
  
  def self.class_var
    @@class_var
  end
  
  def self.class_var=(value)
    @@class_var = value
  end
  
  def self.class_instance_var
    @class_instance_var
  end
  
  def self.class_instance_var=(value)
    @class_instance_var = value
  end
end


class SubThing < Thing
  
  def self.class_var
    @@class_var
  end
  
  def self.class_var=(value)
    @@class_var = value
  end
  
  def self.class_instance_var
    @class_instance_var
  end
  
  def self.class_instance_var=(value)
    @class_instance_var = value
  end
end

def show_vars
  puts '----------------------'
  puts "Thing.class_var=#{Thing.class_var}"
  puts "Thing.class_instance_var=#{Thing.class_instance_var}"
  puts "SubThing.class_var=#{SubThing.class_var}"
  puts "SubThing.class_instance_var=#{SubThing.class_instance_var}"
end

show_vars
SubThing.class_var='Changed by subthing'
SubThing.class_instance_var='changed by subthing'
show_vars
Thing.class_var='Changed by thing'
Thing.class_instance_var='Changed by thing'
show_vars