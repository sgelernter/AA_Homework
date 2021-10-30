class LRUCache

    attr_accessor :cache
    attr_reader :max_size

    def initialize(max_size)
        @cache = []
        @max_size = max_size
    end

    def count
      @cache.count
    end

    def add(el)
        @cache.delete(el) if @cache.include?(el) #could be made more efficient by using a hash to check for inclusion and a linked list to reorder if necessary
        @cache << el
        @cache.shift if @cache.length > max_size
    end

    def show
      p @cache
    end

    private
    # helper methods go here!

  end

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

  johnny_cache.show