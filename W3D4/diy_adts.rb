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