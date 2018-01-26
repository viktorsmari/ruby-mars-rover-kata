require 'nasa'
RSpec.describe Nasa, "# We are the robots" do
  # Setup
  n = Nasa.new()

  context "receiving data from file" do
#    it "gets starting coordinates and instructions" do
#      expect(n.get_data).to eql [["1 2 N", "LMLMLMLMM"], ["3 3 E", "MMRMMRMRRM"]]
#    end
#    it "moving robot 1" do
#      expect(n.move_robot("1 2 N", "LMLMLMLMM")).to eql ("1 3 N")
#    end
#    it "moving robot 2" do
#      expect(n.move_robot("3 3 E", "MMRMMRMRRM")).to eql ('5 1 E')
#    end
#    it "moving multiple robots at once" do
#      expect(n.mission_from_file).to eql (["1 3 N", "5 1 E"])
#    end
  end

  context "using fixed input (not external file)" do
    it "gets expected output using fixed input" do
      expect(n.mission([ "5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM" ])).to \
        eql (["1 3 N", "5 1 E"])
    end

#    context "grid size" do
#      it "matches input" do
#        expect(n.grid).to eql ('5 5')
#      end
#    end
  end
end
