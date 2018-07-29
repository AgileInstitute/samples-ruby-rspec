require 'rspec'
require_relative 'my_set'

describe MySet do
  before :each do 
    @set = MySet.new
  end

  it "should be instantiable" do
    @set.should_not be_nil
  end

  it "should be empty by default" do
    @set.should be_empty
  end

  it "should allow the addition of elements" do
    @set.add 'a'
    @set.should_not be_empty
  end

  it "should know how many elements are in it" do
    @set.size.should eq(0) 
    @set.add 'a'
    @set.size.should == 1
  end

  it "should know if it contains an element" do
    @set.add 'a'
    @set.should be_contains('a')
    @set.should_not be_contains('b')
  end

  it "should not allow the addition duplicates" do
    @set.add 'a'
    @set.add 'a'
    @set.size.should == 1
  end

  it "should know how it intersects with another set" do
    @set.add 'a'
    @set.add 'b'

    @set2 = MySet.new
    @set2.add 'a'
    @set2.add 'c'

    intersection = @set.intersect(@set2)
    intersection.class.should == MySet
    intersection.size.should == 1
    intersection.should be_contains('a')
  end

  it "should expose its elements as an array" do
    @set.to_a.should be_empty
    @set.add 'a'
    @set.to_a.should_not be_empty
  end

  it "should know how to unite with another set" do
    @set.add 'a'
    @set.add 'b'

    @set2 = MySet.new
    @set2.add 'a'
    @set2.add 'c'

    union = @set.union(@set2)
    union.should be_contains('a')
    union.should be_contains('b')
    union.should be_contains('c')

  end
end
