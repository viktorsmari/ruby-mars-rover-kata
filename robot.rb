
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


DIR = {"N" => 0, "E" => 1, "S" => 2, "W" => 3 }

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
      #puts 'RIGHT'
    when 'M'
      #moving up +1 from north is the second letter increment
      puts 'MOVE'
    end
    startingArray[2] = DIR.key(dir_key_number)
    p startingArray[2]
  end
  # Change the array back to a string
  #p startingArray
  puts startingArray.join(" ")
end

# Robots array:
#[["1 2 N", "LMLMLMLMM"], ["3 3 E", "MMRMMRMRRM"]]

robots.each do |starting, instruction|
  move_robot(starting, instruction)
end
