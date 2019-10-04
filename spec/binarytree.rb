class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left=nil, right=nil)
    @payload = payload
    @left = left
    @right = right
  end
end

def binary_search(target, node)
  unless node.payload != target
    puts "#{node.payload}"
    return
  end
  unless node.left.nil?
    binary_search(target, node.left)
  end
  unless node.right.nil?
    binary_search(target, node.right)
  end

end

def sort(array)
  trunk = BTreeNode.new(array.shift)
  while !array.empty?
    @node = trunk
    value = array.shift
    while @node
      if value < @node.payload
        if @node.left.nil?
          new_node = BTreeNode.new(value)
          @node.left = new_node
          @node = new_node
          #byebug
          break
        else
          @node= @node.left
        end
      else
        if @node.right.nil?
          new_node = BTreeNode.new(value)
          @node.right = new_node
          @node = new_node
          break
        else
          @node = @node.right
        end
      end
    end
  end
  new_array = build_array(trunk)
  print new_array
  puts
end

#recursion searches down the tree, only when node = nil does code continue until
#end and returns an array with an element,
#this kicks up into the previous recursive shell, concatenates whatever was there
#onto the array, then continues with the next line
def build_array(node)
  return [] if node.nil?
  results = []
  results.concat build_array(node.left)
  results << node.payload
  results.concat build_array(node.right)
  results
end


array = [7,4,9,1,6,14,10]
sort(array)