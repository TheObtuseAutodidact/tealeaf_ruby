#1. Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.


#2. Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

#3. You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.

class MyCar

  attr_accessor :current_speed, :car_state, :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @car_state = 'off'
  end

  def current_speed
    @current_speed
  end

  def speed_up(increase_speed_by)
    @current_speed += increase_speed_by
  end

  def brake(decrease_speed_by)
    unless (@current_speed - decrease_speed_by) < 0
      @current_speed -= decrease_speed_by
    else
      @current_speed = 0
    end
  end

  def ignition(on_or_off)
    case on_or_off
    when "on"
      @car_state = "on"
    when 'of'
      @car_state = "off"
    else
      puts "Invalid argument for ignition"
    end
  end

  def spray_paint(new_color)
    @color = new_color
  end

end

car = MyCar.new(1982, "blue", "Yugo")
puts car.current_speed
car.ignition("on...on...on...")
puts car.car_state
car.ignition("on")
puts car.car_state
car.speed_up(25)
puts car.current_speed
puts car.car_state
puts car.color
car.spray_paint("a slightly lighter shade of blue")
puts car.color
puts car.current_speed
car.brake(1)
puts car.current_speed
car.brake(100)
puts car.current_speed
