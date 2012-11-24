require "./lib/board"

describe Board do
  it "initalizes with no score for either player" do
    b = Board.new("abcde fghij klmno pqrst uvwxy")
    b.score(:red).should == 0
  end
end
