require "byebug"

class GraphNode

    attr_reader :value, :neighbors
    attr_writer :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

end


def bfs(starting_node, target, visited = Set.new([starting_node])) 
    queue = [starting_node]
    
    until queue.empty?
        node = queue.shift
        return node if node.value == target
        node.neighbors.each do |neighbor|
            unless visited.add?(neighbor) == nil 
                queue.push(neighbor)
            end
        end
    end
    nil
end


a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

