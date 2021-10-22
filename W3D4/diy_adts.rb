require "byebug"

class Stack

    attr_accessor :data

    def initialize
        @data = []
    end

    def push(el)
        data.push(el)
    end

    def pop
        data.pop
    end

    def peek
        data.last
    end

end

class Queue

    def initialize
        @queue = []
    end

    def enq(el)
        @queue.push(el)
    end

    def deq
        @queue.shift
    end

    def peek
        @queue.first
    end

end

class Map

    def initialize
        @map = []
    end

    def set(k, v)
        all_keys = @map.map {|pair| pair.first }
        if !all_keys.include?(k)
            @map << [k, v]
        else
            @map.map! do |pair| 
                if pair.first == k
                    [k,v] 
                else
                    pair
                end
            end
        end
    end

    def get(k)
        @map.each do |pair|
            return pair if pair.first == k 
        end
    end

    def delete(k)
        @map.delete_if { |pair| pair.first == k }
    end

    def show
        print @map
    end
end