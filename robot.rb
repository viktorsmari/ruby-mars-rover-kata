
DIR = {"N" => 0, "E" => 1, "S" => 2, "W" => 3 }

# Read the input file into a variable
input_file = File.read('./input.txt')

# Separate each line into an array
myArr = input_file.split("\n")
#["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"]

# The first number is the grid size, remove it to its own var
grid_size = myArr.shift
#["1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"]

#puts 'Grid size: ' + grid_size

# Put each robot into its own array, within the array
robots = myArr.each_slice(2).to_a
# [["1 2 N", "LMLMLMLMM"], ["3 3 E", "MMRMMRMRRM"]]


def move_robot(starting, instruction)

  # Change the starting string to an array
  startingArray = starting.split

  instruction.split("").each do |x|
    # Current orientation is kept (as a letter) at: startingArray[2]
    # Change it to a key (number) of 1..4
    dir_key_number = DIR[startingArray[2]]

    case x
    when 'L'
      # When going left, your direction goes +3 (instead of -1 which fails with modulus)
      dir_key_number = (dir_key_number + 3) % 4
    when 'R'
      # When going left, your direction goes +1
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
  # Print the array as a string
  puts startingArray.join(" ")
end

# Robots array:
#[["1 2 N", "LMLMLMLMM"], ["3 3 E", "MMRMMRMRRM"]]

robots.each do |starting, instruction|
  move_robot(starting, instruction)
end
