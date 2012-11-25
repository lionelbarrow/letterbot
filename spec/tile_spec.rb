require "./lib/tile"

describe Tile do
  it "has a position" do
    t = Tile.new("a", 1)
    t.position.should == 1
  end

  it "has a letter" do
    t = Tile.new("a", 1)
    t.letter.should == "a"
  end

  it "can set an owner" do
    t = Tile.new("a", 1)
    t.owner = :red
    t.owner.should == :red
  end
end
