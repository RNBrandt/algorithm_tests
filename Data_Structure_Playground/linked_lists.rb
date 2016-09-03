#Challenge 1 create an algorithm which will find the nth from the end node of a linked list.
#method, create a pointer which will be created -n nodes from a lead pointer.
#edges 1) If there aren't n nodes

#Challenge two, make a Balanced Binary Search tree out of an  un-sorted DLL
require_relative 'node_sorter'

class Linked_list < Node_sorter
  attr_accessor :tail, :root
  attr_reader :list_length
  def initialize
    @root = nil
    @tail = nil
  end

  def add_unordered_node(value)
    node = Node.new(value)
    if !@tail
      @tail = node
      @root = node
    else
      @tail.bigger = node
      node.smaller = @tail
      @tail = node
    end
  end

  def add_ordered_node(value)
    node = Node.new(value)
    current = @root
    if !@tail
      @tail = node
      @root = node
    elsif node.value <= @root.value
      temp = @root
      @root = node
      @root.bigger = temp
      temp.smaller = @root
    elsif node.value >= @tail.value
      temp = @tail
      node.smaller = temp
      temp.bigger = node
      @tail = node
    else
      until current.value >= node.value
        p "until current value #{current.value}"
        current = current.bigger
      end
      p "current.value #{current.value} node.value #{node.value}"
      node.smaller = current.smaller
      current.smaller.bigger = node
      p "current.smaller #{current.smaller.value} node.smaller #{node.smaller.value}"
      current.smaller = node
      p "current.smaller #{current.smaller.value}"
      node.bigger = current
      puts "node.bigger #{node.bigger.value}"
    end
  end

  def find_nth_from_end(n)
    lead_pointer = @root
    counter = 2
    (n-1).times do
      lead_pointer = lead_pointer.bigger
      if (lead_pointer == @tail) && (counter != n)
        return "There aren't #{n} values"
      end
      counter +=1
    end
    following_pointer = @root
    until !lead_pointer.bigger
      lead_pointer = lead_pointer.bigger
      following_pointer = following_pointer.bigger
    end
    return following_pointer.value
  end
end


