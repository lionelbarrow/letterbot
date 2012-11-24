class WordBag
  attr_reader :letter_counts, :word

  def initialize(word)
    @letter_counts = count_letters(word)
    @word = word
  end

  def count_letters(word)
    letter_counts = Hash.new(0)
    word.split('').each do |letter|
      letter_counts[letter] += 1
    end
    letter_counts
  end

  def subset?(other_word_bag)
    @letter_counts.keys.each do |letter|
      return false if other_word_bag.letter_counts[letter].nil? || other_word_bag.letter_counts[letter] < @letter_counts[letter]
    end
    true
  end
end
