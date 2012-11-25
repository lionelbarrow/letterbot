class Tile
  attr_reader :position, :letter, :owner
  attr_writer :owner

  def initialize(letter, position)
    @letter = letter
    @position = position
  end
end
