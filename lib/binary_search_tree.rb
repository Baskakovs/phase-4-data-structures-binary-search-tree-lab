require_relative './node'
require "byebug"
class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def search(value)
    # your code here
    nodes_to_visit = [@root]
    if @root.nil?
      nil
    else
      while true && nodes_to_visit.length > 0
        node = nodes_to_visit.shift
        if node.value == value
          return node
        elsif node.value > value
          if node.left.nil?
            nil
          else
            nodes_to_visit = [node.left]
          end
        elsif node.value < value
          if node.right.nil?
            nil
          else
            nodes_to_visit = [node.right]
          end
        else 
          nil
        end
      end
    end
  end

  def insert(value)
    # your code here
    current_node = [@root]
    if @root.nil?
      @root = Node.new(value)
      return @root
    else
      while true && current_node.length > 0
        node = current_node.shift
        # byebug
        if node.value == value
          return nil
        else
          # byebug
          if node.value > value
            if node.left.nil?
              return node.left = Node.new(value)
            else
              current_node = [node.left]
            end
          elsif node.value < value
            if node.right.nil?
              return node.right = Node.new(value)
            else
              current_node = [node.right]
            end
          end
        end 
      end
    end
  end

end 
