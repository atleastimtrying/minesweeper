class Tile

  def initialize has_mine
    @has_mine = has_mine
  end

  def dig
    @has_mine ? "boom" : "fine"
  end
end