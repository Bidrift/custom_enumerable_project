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
