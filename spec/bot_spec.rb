require "./lib/bot"

describe Bot do
  it "creates a list of moves" do
    b = Bot.new(g)
    b.available_moves.length.should == 0
  end

  it "evaluates the quality of moves" do
  end
end
