require 'minitest/autorun'     # => true
require 'minitest/pride'       # => true
require_relative '../lib/BST'  # => true


class BinarySearchTest < Minitest::Test  # => Minitest::Test

  # insert a new unique value into the tree
  def test_it_inserts_unique_value_into_tree
    tree = Node.new 'd',                      # => "d"
             Node.new('b',                    # => "b"
               Node.new('a'),                 # => #<Node:0x007f92440e6d38 @data="a", @left=nil, @right=nil>
               Node.new('c')),                # => #<Node:0x007f92440e6a18 @data="b", @left=#<Node:0x007f92440e6d38 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f92440e6a68 @data="c", @left=nil, @right=nil>>
             Node.new('f',                    # => "f"
               Node.new('e'),                 # => #<Node:0x007f92440e6478 @data="e", @left=nil, @right=nil>
               Node.new('g'))                 # => #<Node:0x007f92440e6130 @data="d", @left=#<Node:0x007f92440e6a18 @data="b", @left=#<Node:0x007f92440e6d38 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f92440e6a68 @data="c", @left=nil, @right=nil>>, @right=#<Node:0x007f92440e6180 @data="f", @left=#<Node:0x007f92440e6478 @data="e", @left=nil, @right=nil>, @right=#<Node:0x007f92440e61d0 @data="g", @left=nil, @right=nil>>>

    insert_node(tree, 'clay')  # => #<Node:0x007f92440e5ac8 @data="clay", @left=nil, @right=nil>
    include?(tree, 'clay')     # => nil

  end  # => :test_it_inserts_unique_value_into_tree

  # verify/reject the presence of a value in the tree with include?
  def test_verify_or_reject_presence_of_a_value
    tree = Node.new 'd',                         # => "d"
             Node.new('b',                       # => "b"
               Node.new('a'),                    # => #<Node:0x007f92440e50f0 @data="a", @left=nil, @right=nil>
               Node.new('c')),                   # => #<Node:0x007f92440e4df8 @data="b", @left=#<Node:0x007f92440e50f0 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f92440e4e48 @data="c", @left=nil, @right=nil>>
             Node.new('f',                       # => "f"
               Node.new('e'),                    # => #<Node:0x007f92440e4858 @data="e", @left=nil, @right=nil>
               Node.new('g'))                    # => #<Node:0x007f92440e4510 @data="d", @left=#<Node:0x007f92440e4df8 @data="b", @left=#<Node:0x007f92440e50f0 @data="a", @left=nil, @right=nil>, @right=#<Node:0x007f92440e4e48 @data="c", @left=nil, @right=nil>>, @right=#<Node:0x007f92440e4560 @data="f", @left=#<Node:0x007f92440e4858 @data="e", @left=nil, @right=nil>, @right=#<Node:0x007f92440e45b0 @data="g", @left=nil, @right=nil>>>
    include?(tree, 'e')                          # => nil
    include?(tree, 'popsicle')                   # => nil
  end                                            # => :test_verify_or_reject_presence_of_a_value

  # report the depth of a node in the tree with depth_of
  def test_it_reports_depth_of_a_node_in_the_tree

  end  # => :it_reports_depth_of_a_node_in_the_tree

  # find the maximum value in the tree
  def test_it_finds_max_value_in_tree
    tree = Node.new 'd',
             Node.new('b',
               Node.new('a'),
               Node.new('c')),
             Node.new('f',
               Node.new('e'),
               Node.new('g'))
    start_node = tree.data
    maximum(tree, start_node)
  end                             # => :it_finds_max_value_in_tree

  # find the minimum value in the tree
  def test_it_finds_min_value_in_tree
    tree = Node.new 'd',
             Node.new('b',
               Node.new('a'),
               Node.new('c')),
             Node.new('f',
               Node.new('e'),
               Node.new('g'))
    start_node = tree.data
    minimum(tree, start_node)
  end                             # => :it_finds_min_value_in_tree

  # implement a sort that outputs an array of the values in sorted order (by traversing the tree, not using Ruby's sort method)
  def it_outputs_array_of_values_in_sorted_order

  end  # => :it_outputs_array_of_values_in_sorted_order

end  # => :it_outputs_array_of_values_in_sorted_order

# >> found c!
# >> value coke not included in tree
# >> maximum value is g
# >> minimum value is a
# >> Run options: --seed 11147
# >>
# >> # Running:
# >>
# >> found clay!
# >> .found e!
# >> value popsicle not included in tree
# >> .
# >>
# >> Finished in 0.001865s, 1072.2969 runs/s, 0.0000 assertions/s.
# >>
# >> 2 runs, 0 assertions, 0 failures, 0 errors, 0 skips
