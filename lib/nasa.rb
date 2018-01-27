require 'rover'
class Nasa
  attr_accessor :grid

  def mission(input_string)
    @grid = input_string.shift

    result = []
    robots = input_string.each_slice(2).to_a
    robots.each do |starting, instruction|
      result.push(Rover.new(@grid).move_robot(starting, instruction))
    end
    result
  end
end
