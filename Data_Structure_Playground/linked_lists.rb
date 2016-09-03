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
      node.bigger = temp
      temp.smaller = node
      @root = node
    elsif node.value >= @tail.value
      temp = @tail
      node.smaller = temp
      temp.bigger = node
      @tail = node
    else
      # current is the smallest, so increase the 'current' node until it's greater than the new node
      until current.value >= node.value
        current = current.bigger
      end
      # once the current is larger than the node. I want to 1) take the node.smaller and make it the value from the current.smaller
      node.smaller = current.smaller
      # take the current.smaller value be the node
      current.smaller = node
      #take the node.bigger value and make it current
      node.bigger = current
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


list = Linked_list.new

p list.add_ordered_node(8)
p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
p list
p "***************************************"
p list.add_ordered_node(2)
p "***************************************"
p list
p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
p list.add_ordered_node(5)
p "***************************************"
p list
# p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
# list.add_ordered_node(15)

# p list

# p list.root.value
# p list.root.bigger.value
# p list.root.bigger.bigger.value
# p list.root.bigger.bigger.bigger.value
