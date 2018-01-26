require 'rover'
class Nasa
  # Each direction has a number, so we can easily increment/decrement

  attr_accessor :grid

  def get_data
    # Read the input file into a variable
    input_file = File.read('./input.txt')

    # Separate each line into an array
    myArr = input_file.split("\n")
    # myArr = ["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"]

    # The first number is the grid size, remove it to its own var
    @grid = myArr.shift
    # myArr = ["1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"]

    #puts 'Grid size: ' + grid_size

    # Put each robot into its own array, inside another array
    robots = myArr.each_slice(2).to_a
    # robots = [["1 2 N", "LMLMLMLMM"], ["3 3 E", "MMRMMRMRRM"]]
  end

  def mission(input_string)
    tmpgrid = input_string.shift

    result = []
    robots = input_string.each_slice(2).to_a
    robots.each do |starting, instruction|
      result.push(Rover.new(tmpgrid).move_robot(starting, instruction))
    end
    result
  end

  def mission_from_file
    robots = get_data
    # Move all robots, one by one
    result = []
    robots.each do |starting, instruction|
      result.push(Rover.new.move_robot(starting, instruction))
    end

    result
  end
end
