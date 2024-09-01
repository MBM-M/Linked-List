require_relative 'Node.rb'

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next = new_node
      @tail = new_node
    end
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
    @size += 1
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    return nil if index < 0 || index >= @size
    current = @head
    index.times { current = current.next }
    current
  end

  def pop
    return nil if @head.nil?
    popped_value = @head.value
    @head = @head.next
    @size -= 1
    @tail = (@head == nil ? nil : @head.tail)
    popped_value
  end

  def contains?(value)
    current = @head
    until current.nil?
      return true if current.value == value
      current = current.next
    end
    false
  end

  def find(value)
    index = 0
    current = @head
    until current.nil?
      return index if current.value == value
      current = current.next
      index += 1
    end
    nil
  end

  def to_s
    current = @head
    result = ''
    until current.nil?
      result << "( "
      result << "#{current.value}"
      current = current.next
      result << " ) -> "
    end
    result << "nil"
  end
end