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