require_relative '../lib/game'
require_relative '../lib/tile'

describe Game do
  let(:game) { Game.new(seed) }
  context 'with no seed' do
    let(:seed) { nil }
    
    it "shows a 2d array of Tiles" do
      expect(game.show.first.first).to be_a_kind_of Tile
    end
  end

  context 'with a seed of one tile and one mine' do
    let(:seed) { [[1]] }

    it "shows a 2d array of Tiles" do
      expect(game.show.first.first).to be_a_kind_of Tile
    end

    it "shows the correct tile at 0,0" do
      expect(game.show.first.first.dig).to eq "boom"
    end

    it "returns boom from dig(0,0)" do
      expect(game.dig(0,0)).to eq "boom"
    end
  end


  context 'with a seed of one tile and no mine' do
    let(:seed) { [[0]] }

    it "shows a 2d array of Tiles" do
      expect(game.show.first.first).to be_a_kind_of Tile
    end

    it "shows the correct tile at 0,0" do
      expect(game.show.first.first.dig).to eq "fine"
    end

    it "returns 0 from dig(0,0)" do
      expect(game.dig(0,0)).to eq 0
    end
  end

  context 'with a seed of four tiles with corner mine' do
    let(:seed) { [[0,0],[0,1]] }
    it "shows a 2d array of Tiles in the right shape" do
      expect(game.show.count).to eq 2
      expect(game.show.first.count).to eq 2
    end

    it "gives a neighbouring mine count of 1 for 0,0" do
      expect(game.neighbouring_mine_count(0,0)).to eq 1
    end

    it "returns 1 from dig(0,0)" do
      expect(game.dig(0,0)).to eq 1
    end
    
    it "returns 1 from dig(0,1)" do
      expect(game.dig(0,1)).to eq 1
    end
    
    it "returns 1 from dig(1,0)" do
      expect(game.dig(1,0)).to eq 1
    end
    
    it "returns boom from dig(1,1)" do
      expect(game.dig(1,1)).to eq "boom"
    end
  end
end