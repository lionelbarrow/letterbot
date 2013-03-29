require "./lib/word_bag"

def best_moves(letters)
  letter_wordbag = WordBag.new(letters)
  wordbags = File.open('/usr/share/dict/words').collect { |word| WordBag.new(word.strip) }
  matches = []
  wordbags.each do |wordbag|
    matches << wordbag if wordbag.subset?(letter_wordbag)
  end
  sorted_matches = matches.sort! { |x, y| x.word.length <=> y.word.length }
  return sorted_matches.map { |wordbag| wordbag.word }
end

puts best_moves("odvpvtjmqesnwuxhvnaionwan")
