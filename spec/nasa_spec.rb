require 'nasa'
RSpec.describe Nasa, "# We are the robots" do
  # Setup
  n = Nasa.new()

  context "receiving data from file" do
    it "gets starting coordinates and instructions" do
       expect(n.get_data).to eql [["1 2 N", "LMLMLMLMM"], ["3 3 E", "MMRMMRMRRM"]]
    end
  end

  context "moving robots one by one" do
    it "gets correct output for robot 1" do
      expect(n.move_robot("1 2 N", "LMLMLMLMM")).to eql ("1 3 N")
    end

    it "gets correct output for robot 2" do
      expect(n.move_robot("3 3 E", "MMRMMRMRRM")).to eql ('5 1 E')
    end
  end

  context "moving multiple robots at once" do
    it "gets expected output" do
      expect(n.start_mission).to eql (["1 3 N", "5 1 E"])
    end
  end

  context "get correct grid size" do
    #puts n.grid_size
  end
end
