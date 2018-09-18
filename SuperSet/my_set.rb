class MySet
  def initialize
    @elements = []
  end

  def empty?
    @elements.empty?
  end

  def add element
    @elements << element unless @elements.include?(element)
  end

  def size
    @elements.size
  end

  def contains? element
    @elements.include? element
  end

  def intersect another_set
    intersection = MySet.new

    @elements.each do |e|
      intersection.add e if another_set.contains?(e)
    end

    intersection
  end

  def to_a
    @elements
  end

  def union another_set
    united = MySet.new
    @elements.each do |e|
      united.add e
    end

    another_set.to_a.each do |e|
      united.add e
    end

    united
  end

end
