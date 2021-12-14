require_relative '../lib/game'
require_relative '../lib/tile'

describe Tile do
  let(:has_mine) { false }
  let(:tile) { Tile.new(has_mine) }

  context 'with no mine' do
    it "does not explode on dig" do
      expect(tile.dig).to eq "fine"
    end
  end

  context 'with a mine' do
    let(:has_mine) { true }
    it "does not explode on dig" do
      expect(tile.dig).to eq "boom"
    end
  end
end