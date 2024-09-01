class Node
  attr_accessor :value, :next

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end