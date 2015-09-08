

class Node
  attr_accessor :data, :left, :right          # => nil
  def initialize(data, left=nil, right=nil)
    @data, @left, @right = data, left, right  # => ["a", nil, nil], ["c", nil, nil], ["b", #<Node:0x007f9d8220cea8 @data="a", @left=nil, @right=nil>, #<Node:0x007f9d8220c958 @data="c", @left=nil, @right=nil>], ["e", nil, nil], ["g", nil, nil], ["f", #<Node:0x007f9d82207d90 @data="e", @left=nil, @right=nil>, #<Node:0x007f9d82207908 @data="g", @left=nil, @right=nil>], ["d", #<Node:0x007f9d8220c700 @data="b", @left=#<Node:0x007f9d8220cea8 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f9d8220c958 @data="c", @left=nil, @right=nil>>, #<Node:0x007f9d822076d8 @data="f", @left=#<Node:0x007f9d82207d90 @data="e", @left=nil, @right=nil>, @right=#<Node:0x007f9d82207908 @data="g", @left=nil, @right=nil>>], ["coy", nil, nil]
  end                                         # => :initialize

end  # => :initialize

def traverse(node)
  node.data                 # => "d"
  node.left                 # => #<Node:0x007f9d8220c700 @data="b", @left=#<Node:0x007f9d8220cea8 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f9d8220c958 @data="c", @left=nil, @right=nil>>
  node.left.data            # => "b"
  current_node = node.left  # => #<Node:0x007f9d8220c700 @data="b", @left=#<Node:0x007f9d8220cea8 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f9d8220c958 @data="c", @left=nil, @right=nil>>
  current_node.left.data    # => "a"
  node.right                # => #<Node:0x007f9d822076d8 @data="f", @left=#<Node:0x007f9d82207d90 @data="e", @left=nil, @right=nil>, @right=#<Node:0x007f9d82207908 @data="g", @left=nil, @right=nil>>
  node.right.data           # => "f"
end  #end traverse

# verify/reject the presence of a value in the tree with include?
def include?(node, value)
  if value == node.data                             # => false, false, true, false, false, false, false
    puts "found #{value}!"                          # => nil
    return
  else
    if value > node.data                            # => false, true, false, true, true, false
      current_node = node.right                     # => #<Node:0x007f9d8220c958 @data="c", @left=nil, @right=nil>, #<Node:0x007f9d8220c958 @data="c", @left=nil, @right=#<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>>, #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>
      if current_node == nil                        # => false, false, false
        puts "value #{value} not included in tree"
      else
        include?(current_node, value)               # => nil, nil, nil
      end                                           # => nil, nil, nil
    else
      #value is less than
      current_node = node.left                      # => #<Node:0x007f9d8220c700 @data="b", @left=#<Node:0x007f9d8220cea8 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f9d8220c958 @data="c", @left=nil, @right=nil>>, #<Node:0x007f9d8220c700 @data="b", @left=#<Node:0x007f9d8220cea8 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f9d8220c958 @data="c", @left=nil, @right=#<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>>>, nil
      if current_node == nil                        # => false, false, true
        puts "value #{value} not included in tree"  # => nil
      else
        include?(current_node, value)               # => nil, nil
      end                                           # => nil, nil, nil
    end                                             # => nil, nil, nil, nil, nil, nil
  end
end  #end find_node

# insert a new unique value into the tree
def insert_node(node, value)
  if value > node.data                               # => false, true, true
    node.right                                       # => #<Node:0x007f9d8220c958 @data="c", @left=nil, @right=nil>, nil
    if node.right == nil                             # => false, true
      #insert data HERE and point to it
      new_node = Node.new(value, nil, nil)           # => #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>
      node.right = new_node                          # => #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>
    else
      if value < node.right.data                     # => false
        #insert current value HERE and push child nodes down the tree
        new_node = Node.new(value, nil, node.right)
        #make the right node of the node we are looking at point to the new node
        node.right = new_node
      else
        #continue comparison
        insert_node(node.right, value)               # => #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>
      end                                            # => #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>
    end                                              # => #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>, #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>
  else
    #value is less than current value
    if node.left == nil                              # => false
      #insert data HERE and point to it
      new_node = Node.new(value, nil, nil)
      node.left = new_node
    else
      if value < node.left.data                      # => false
        #insert current value HERE and push child nodes down the tree
        new_node = Node.new(value, nil, node.left)
        #make the right node of the node we are looking at point to the new node
        node.left = new_node
      else
        #continue comparison
        insert_node(node.left, value)                # => #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>
      end                                            # => #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>
    end                                              # => #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>
  end                                                # => #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>, #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>, #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>
end  #end find_node

# report the depth of a node in the tree with depth_of
def depth_of(node, value, initial)
  if value == node.data                            # => false, false, false, true
    count = initial + 1                            # => 4
    return
  else
    if value > node.data                           # => false, true, true
      current_node = node.right                    # => #<Node:0x007f9d8220c958 @data="c", @left=nil, @right=#<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>>, #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>
      count = initial + 1                          # => 2, 3
      depth_of(current_node, value, count)         # => nil, nil
    else
      current_node = node.left                     # => #<Node:0x007f9d8220c700 @data="b", @left=#<Node:0x007f9d8220cea8 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f9d8220c958 @data="c", @left=nil, @right=#<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>>>
      count = initial + 1                          # => 1
      depth_of(current_node, value, count)         # => nil
    end                                            # => nil, nil, nil
  end
  count                                            # => 3, 2, 1
  puts "#{value} is #{count} levels deep in tree"  # => nil, nil, nil
end                                                # => :depth_of

# find the maximum value in the tree
def maximum(tree, start_node)
  if tree.right == nil && tree.left == nil      # => false, false, true
    puts "maximum value is #{start_node}"       # => nil
  else
    if tree.right.data > start_node             # => true, true
      current_node = tree.right                 # => #<Node:0x007f9d822076d8 @data="f", @left=#<Node:0x007f9d82207d90 @data="e", @left=nil, @right=nil>, @right=#<Node:0x007f9d82207908 @data="g", @left=nil, @right=nil>>, #<Node:0x007f9d82207908 @data="g", @left=nil, @right=nil>
      maximum(current_node, current_node.data)  # => nil, nil
     else
      #left side is greater
      current_node = tree.left
      maximum(current_node, current_node.data)
    end                                         # => nil, nil
  end                                           # => nil, nil, nil
end                                             # => :maximum

# find the minimum value in the tree
def minimum(tree, start_node)
  if tree.right == nil && tree.left == nil      # => false, false, true
    puts "minimum value is #{start_node}"       # => nil
  else
    if tree.left.data < start_node              # => true, true
      current_node = tree.left                  # => #<Node:0x007f9d8220c700 @data="b", @left=#<Node:0x007f9d8220cea8 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f9d8220c958 @data="c", @left=nil, @right=#<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>>>, #<Node:0x007f9d8220cea8 @data="a", @left=nil, @right=nil>
      minimum(current_node, current_node.data)  # => nil, nil
     else
      #right side is less than
      current_node = tree.right
      minimum(current_node, current_node.data)
    end                                         # => nil, nil
  end                                           # => nil, nil, nil
end                                             # => :minimum

# implement a sort that outputs an array of the values in sorted order (by traversing the tree, not using Ruby's sort method)

tree = Node.new 'd',        # => "d"
         Node.new('b',      # => "b"
           Node.new('a'),   # => #<Node:0x007f9d8220cea8 @data="a", @left=nil, @right=nil>
           Node.new('c')),  # => #<Node:0x007f9d8220c700 @data="b", @left=#<Node:0x007f9d8220cea8 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f9d8220c958 @data="c", @left=nil, @right=nil>>
         Node.new('f',      # => "f"
           Node.new('e'),   # => #<Node:0x007f9d82207d90 @data="e", @left=nil, @right=nil>
           Node.new('g'))   # => #<Node:0x007f9d82207368 @data="d", @left=#<Node:0x007f9d8220c700 @data="b", @left=#<Node:0x007f9d8220cea8 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f9d8220c958 @data="c", @left=nil, @right=nil>>, @right=#<Node:0x007f9d822076d8 @data="f", @left=#<Node:0x007f9d82207d90 @data="e", @left=nil, @right=nil>, @right=#<Node:0x007f9d82207908 @data="g", @left=nil, @right=nil>>>

traverse(tree)            # => "f"
include?(tree, 'c')       # => nil
insert_node(tree, 'coy')  # => #<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>
include?(tree, 'coke')    # => nil

initial = 0                     # => 0
depth_of(tree, 'coy', initial)  # => nil

start_node = tree.data     # => "d"
maximum(tree, start_node)  # => nil
minimum(tree, start_node)  # => nil

tree  # => #<Node:0x007f9d82207368 @data="d", @left=#<Node:0x007f9d8220c700 @data="b", @left=#<Node:0x007f9d8220cea8 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f9d8220c958 @data="c", @left=nil, @right=#<Node:0x007f9d821fd2c8 @data="coy", @left=nil, @right=nil>>>, @right=#<Node:0x007f9d822076d8 @data="f", @left=#<Node:0x007f9d82207d90 @data="e", @left=nil, @right=nil>, @right=#<Node:0x007f9d82207908 @data="g", @left=nil, @right=nil>>>

# >> found c!
# >> value coke not included in tree
# >> coy is 3 levels deep in tree
# >> coy is 2 levels deep in tree
# >> coy is 1 levels deep in tree
# >> maximum value is g
# >> minimum value is a
