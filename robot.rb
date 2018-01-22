#!/usr/bin/ruby

# Each direction has a number, so we can easily increment/decrement
DIR = {"N" => 0, "E" => 1, "S" => 2, "W" => 3 }

# Read the input file into a variable
input_file = File.read('./input.txt')

# Separate each line into an array
myArr = input_file.split("\n")
# myArr = ["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"]

# The first number is the grid size, remove it to its own var
grid_size = myArr.shift
# myArr = ["1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"]

#puts 'Grid size: ' + grid_size

# Put each robot into its own array, inside another array
robots = myArr.each_slice(2).to_a
# robots = [["1 2 N", "LMLMLMLMM"], ["3 3 E", "MMRMMRMRRM"]]

def move_robot(starting, instruction)
  # Change the starting string to an array
  # "1 2 N"
  startingArray = starting.split
  # ["1", "2", "N"]

  instruction.split("").each do |x|
    # Current orientation is kept (as a letter) at: startingArray[2]
    # Change it to a key (number) of 0..3
    dir_key_number = DIR[startingArray[2]]

    case x
    when 'L'
      # When going left, your direction goes +3 (instead of -1 which fails with modulus)
      dir_key_number = (dir_key_number + 3) % 4
    when 'R'
      # When going right, your direction goes +1
      dir_key_number = (dir_key_number + 1) % 4
    when 'M'
      case startingArray[2]
      when "N"
        #moving up +1 from north is the second letter increment
        startingArray[1] = startingArray[1].to_i + 1
      when "S"
        startingArray[1] = startingArray[1].to_i - 1
      when "E"
        startingArray[0] = startingArray[0].to_i + 1
      when "W"
        startingArray[0] = startingArray[0].to_i - 1
      end
    end
    startingArray[2] = DIR.key(dir_key_number)
  end
  # Print the final array as a string
  puts startingArray.join(" ")
end

# Move all robots, one by one
robots.each do |starting, instruction|
  move_robot(starting, instruction)
end
