require 'nasa'
RSpec.describe Nasa, '# We are the robots' do
  # Setup
  n = Nasa.new()

  context 'using fixed input (not external file)' do
    it 'moves both robots' do
      expect(n.mission(['5 5', '1 2 N', 'LMLMLMLMM', '3 3 E', 'MMRMMRMRRM'])).to \
        eql (['1 3 N', '5 1 E'])
    end
    it 'moves only robot 1' do
      expect(n.mission(['5 5', '1 2 N', 'LMLMLMLMM'])).to eql (['1 3 N'])
    end

#    context 'grid size' do
#      it 'matches input' do
#        expect(n.grid).to eql ('5 5')
#      end
#    end
  end
end
