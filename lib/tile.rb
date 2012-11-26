class Tile
  attr_reader :position, :letter, :owner

  def initialize(letter, position)
    @letter = letter
    @position = position
  end

  def change_owner(new_owner)
    @owner = new_owner
  end
end
