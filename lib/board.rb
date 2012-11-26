require "./lib/tile"
require "./lib/word_bag"


class Board
  def initialize(letters)
    @tiles = []
    i = 0
    letters.split("").each do |letter|
      next if letter.strip == ""
      @tiles << Tile.new(letter, i)
      i += 1
    end
  end

  def move(player, positions)
    positions.each do |pos|
      @tiles[pos].change_owner(player)
    end
  end

  def score(player)
   @tiles.select { |tile| tile.owner == player }.length
  end
end
