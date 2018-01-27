class Rover
  attr_accessor :x, :y, :orientation, :grid
  DIR = { 'N' => 0, 'E' => 1, 'S' => 2, 'W' => 3 }.freeze

  def initialize(tmpgrid)
    @grid = tmpgrid
    @orientation = 0
    @x = 0
    @y = 0
  end

  def move_robot(starting, instruction)
    startingArray = starting.split()
    @x = startingArray[0]
    @y = startingArray[1]
    @orientation = startingArray[2]

    instruction.split('').each do |x|
      # Change it to a key (number) of 0..3
      dir_key_number = DIR[@orientation]

      case x
      when 'L'
        # When going left, your direction goes +3 (instead of -1 which fails with modulus)
        dir_key_number = (dir_key_number + 3) % 4
      when 'R'
        # When going right, your direction goes +1
        dir_key_number = (dir_key_number + 1) % 4
      when 'M'
        case @orientation
        when 'N'
          # moving up +1 from north is the second letter increment
          @y = @y.to_i + 1
        when 'S'
          @y = @y.to_i - 1
        when 'E'
          @x = @x.to_i + 1
        when 'W'
          @x = @x.to_i - 1
        end
      end
      @orientation = DIR.key(dir_key_number)
    end
    "#{@x} #{@y} #{@orientation}"
  end
end
