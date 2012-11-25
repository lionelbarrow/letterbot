require "./lib/tile"
require "./lib/word_bag"

def opponent(player)
  if player == :red
    :blue
  elsif player == :blue
    :red
  end
end

class Board
  def initialize(letters)
    @scores = {:red => 0, :blue => 0}
    @tiles = []
    i = 0
    letters.split("").each do |letter|
      next if letter.strip == ""
      @tiles << Tile.new(letter, i)
      i += 1
    end
  end

  def score(player)
    @scores[player]
  end

  def move(player, positions)
    opponent = opponent(player)
    positions.each do |pos|
      @scores[player] += 1 if @tiles[pos].owner != player
      @scores[opponent] -= 1 if @tiles[pos].owner == opponent
      @tiles[pos].owner = player
    end
  end
end
