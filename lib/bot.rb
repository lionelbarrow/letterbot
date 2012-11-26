require "./lib/board"
require "./lib/word_bag"

class Bot
  def initialize(board)
    @letters = board.tiles.collect {|t| t.letter }
  end

  def available_moves
    @available_moves ||= _find_available_moves
  end

  def _find_available_moves
    letter_wordbag = WordBag.new(letters)
    wordbags = File.open('/usr/share/dict/words').collect { |word| WordBag.new(word.strip) }
    matches = []
    wordbags.each do |wordbag|
      matches << wordbag.word if wordbag.subset?(letter_wordbag)
    end
    matches
  end
end
