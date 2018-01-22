
# Read the input file into a variable
input_file = File.read('./input.txt')

# Separate each line into an array
myArr = input_file.split("\n")

# The first number is the grid size, remove it to its own var
grid_size = myArr.shift

#puts 'Grid size: ' + grid_size

# Put each robot into its own array, within the array: [['1 2 N', 'LMLM'],['3 3 E','MRM']]
robots = myArr.each_slice(2).to_a

#p myArr

def move_robot(starting, instruction)
  current_location = starting
  p current_location
  instruction.split("").each do |x|
    case x
    when 'L'
      # TODO: use enums? N = 0, E = 1, S = 2, W = 3
      # Left would mean direction -= 1
      # Use modulus of 4?
      # Check negative numbers
      #puts 'LEFT'
    when 'R'
      #puts 'RIGHT'
    when 'M'
      #puts 'MOVE'
    end
  end
end

robots.each do |starting, instruction|
  move_robot(starting, instruction)
end
