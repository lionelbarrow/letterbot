require "./lib/word_bag"

describe WordBag do
  it "counts the letters of a word" do
    bag = WordBag.new("")
    bag.count_letters("test").should == {"t" => 2, "e" => 1, "s" => 1}
  end

  context "subset?" do
    it "is false when the word is not a subset of the argument" do
      foo = WordBag.new("foo")
      bar = WordBag.new("bar")
      foo.subset?(bar).should == false
    end

    it "is true when the word is a subset of the argument" do
      foo = WordBag.new("foo")
      foobar = WordBag.new("foobar")
      foo.subset?(foobar).should == true
    end
  end
end
