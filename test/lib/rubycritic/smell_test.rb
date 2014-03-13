require "test_helper"
require "rubycritic/smell"

describe Rubycritic::Smell do
  it "has a context reader" do
    context = "#bar"
    smell = Rubycritic::Smell.new(:context => context)
    smell.context.must_equal context
  end

  it "has a locations reader" do
    location = Rubycritic::Location.new("./foo", "42")
    smell = Rubycritic::Smell.new(:locations => [location])
    smell.locations.must_equal [location]
  end

  it "has a paths reader" do
    path = "./foo"
    line = "42"
    location = Rubycritic::Location.new("./foo", "42")
    smell = Rubycritic::Smell.new(:locations => [location])
    smell.paths.must_equal [path]
  end

  it "has a message reader" do
    message = "This smells"
    smell = Rubycritic::Smell.new(:message => message)
    smell.message.must_equal message
  end

  it "has a score reader" do
    score = 0
    smell = Rubycritic::Smell.new(:score => score)
    smell.score.must_equal score
  end

  it "has a type reader" do
    type = :complexity
    smell = Rubycritic::Smell.new(:type => type)
    smell.type.must_equal type
  end

  it "is sortable" do
    location1 = Rubycritic::Location.new("./foo", 42)
    location2 = Rubycritic::Location.new("./bar", 23)
    location3 = Rubycritic::Location.new("./bar", 16)
    [location1, location2, location3].sort.must_equal [location3, location2, location1]
  end
end
