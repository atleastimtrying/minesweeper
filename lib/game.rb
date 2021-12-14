require_relative './tile'

class Game
  def initialize seed
    @grid = seed || [[0]]
  end

  def show
    @grid.map { |column| column.map{ |cell| Tile.new(cell == 1) } }
  end

  def dig x,y
    tile = show[x][y]
    tile.dig == "boom" ? "boom" : neighbouring_mine_count(x, y)
  end

  def neighbouring_mine_count x, y
    count = 0
    [x-1, x, x+1].each do |row|
      [y - 1, y, y + 1].each do |column|
        
        if(show[x][y])
        puts "#{row}, #{column}"
      end
    end
  end
end