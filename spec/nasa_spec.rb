require 'nasa'
RSpec.describe Nasa, '# We are the robots' do
  # Setup
  before do
    @n = Nasa.new()
  end

  context 'using fixed input (not external file)' do
    it 'moves both robots' do
      expect(@n.mission(['5 5', '1 2 N', 'LMLMLMLMM', '3 3 E', 'MMRMMRMRRM'])).to \
        eql (['1 3 N', '5 1 E'])
      expect(@n.grid).to eql ('5 5')
    end
    it 'moves only robot 1' do
      expect(@n.mission(['5 5', '1 2 N', 'LMLMLMLMM'])).to eql (['1 3 N'])
      expect(@n.grid).to eql ('5 5')
    end
  end
  context 'bigger grid sizes' do
    it 'handles a grid of 1000 x 1000' do
      expect(@n.mission(['1000 1000', '1 2 N', 'LMLMLMLMM'])).to eql (['1 3 N'])
      expect(@n.grid).to eql ('1000 1000')
    end
    it "handles starting at x=100" do
      expect(@n.mission(['1000 1000', '100 2 N', 'LMLMLMLMM'])).to eql (['100 3 N'])
    end
  end
  context 'going off grid' do
    it "cannot go off grid North +y" do
      expect(@n.mission(['5 5', '1 2 N', 'MMMMM'])).to eql (['1 5 N'])
    end
    it "cannot go off grid East +x" do
      expect(@n.mission(['5 5', '1 2 E', 'MMMMM'])).to eql (['5 2 E'])
    end
    it "cannot go off grid South -y" do
      expect(@n.mission(['5 5', '1 2 S', 'MMMMM'])).to eql (['1 0 S'])
    end
    it "cannot go off grid West -x" do
      expect(@n.mission(['5 5', '1 2 W', 'MMMMM'])).to eql (['0 2 W'])
    end
  end
end
