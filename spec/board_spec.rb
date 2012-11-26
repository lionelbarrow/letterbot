require "./lib/board"

describe Board do
  it "initalizes with no score for either player" do
    b = Board.new("abcde fghij klmno pqrst uvwxy")
    b.score(:red).should == 0
  end

  it "maintains a list of letter positions" do
    b = Board.new("abcde fghij kkkkk pqrst uvwxy")
    b.letter_positions["f"].should == [6]
    b.letter_positions["k"].should == [11, 12, 13, 14, 15]
  end

  it "processes a move by a player" do
    b = Board.new("abcde fghij klmno pqrst uvwxy")
    b.move(:red, [6, 1, 3, 5])
    b.score(:red).should == 4
  end

  it "process multiple moves correctly" do
    b = Board.new("abcde fghij klmno pqrst uvwxy")
    b.move(:red, [6, 1, 3, 5])
    b.move(:blue, [18, 16, 1, 3, 5])
    b.score(:red).should == 1
    b.score(:blue).should == 5
  end

  it "rejects moves that cannot be made on the board" do
    b = Board.new("abcde fghij klmno pqrst uvwxy")
    expect do
      b.move(:red, [6, 6, 3, 5])
    end.to raise_error
  end
end
