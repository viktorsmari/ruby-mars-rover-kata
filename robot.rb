
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

robots.each do |starting, instruction|
  puts starting
  puts instruction
end
