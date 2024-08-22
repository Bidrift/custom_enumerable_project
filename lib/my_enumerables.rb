module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0..(self.size-1) do
      yield self[i], i
    end
    self
  end

  def my_select
    selected = []
    self.my_each { |v| selected << v if yield v }
    selected
  end

  def my_all?
    self.my_each { |v| return false unless yield v}
    true
  end

  def my_any?
    self.my_each { |v| return true if yield v}
    false
  end

  def my_none?
    self.my_each { |v| return false if yield v }
    true
  end

  def my_count
    return self.size unless block_given?
    self.my_inject(0) do |a, v|
      a = a + 1 if yield v
      a
    end
  end

  def my_map
    mapped = []
    self.my_each { |v| mapped << (yield v) }
    mapped
  end

  def my_inject(initial_value)
    current = initial_value
    self.my_each { |v| current = (yield current, v)}
    current
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0..(self.size-1) do
      yield self[i]
    end
    self
  end
end
