require 'rover'
class Nasa
  # Each direction has a number, so we can easily increment/decrement

  attr_accessor :grid

  def mission(input_string)
    tmpgrid = input_string.shift

    result = []
    robots = input_string.each_slice(2).to_a
    robots.each do |starting, instruction|
      result.push(Rover.new(tmpgrid).move_robot(starting, instruction))
    end
    result
  end
end
