require "./lib/tile"
require "./lib/word_bag"


class Board
  attr_reader :letter_positions

  def initialize(letters)
    @tiles = []
    @letter_positions = {}
    i = 1
    letters.split("").each do |letter|
      next if letter.strip == ""
      @tiles << Tile.new(letter, i)
      @letter_positions[letter] = [] if @letter_positions[letter].nil?
      @letter_positions[letter] << i
      i += 1
    end
  end

  def move(player, positions)
    raise Exception("Invalid move.") unless _valid_move?(positions)
    positions.each do |pos|
      @tiles[pos].change_owner(player)
    end
  end

  def score(player)
    @tiles.select { |tile| tile.owner == player }.length
  end

  def _valid_move?(positions)
    positions.uniq.length == positions.length
  end
end
