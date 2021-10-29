require "byebug"
school = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
'fiiiissshhhhhh']

def sluggish_octopus(arr)
    longest = ""
    arr.each.with_index do |fish1, i1|
        arr.each.with_index do |fish2, i2|
            if i2 > i1
                longest = fish2.length > fish1.length ? fish2 : fish1
            end
        end
    end
    longest
end

def quick_sort_fish(fish)
    return fish if fish.length <= 1
    checker = fish.shift
    left = fish.select {|onefish| onefish.length <= checker.length }
    right = fish.select {|onefish| onefish.length > checker.length }
    quick_sort_fish(left) + [checker] + quick_sort_fish(right)
end

def dominant_octopus(arr)
    sorted = quick_sort_fish(arr)
    sorted.last
end

def clever_octopus(arr)
    longest_fish = ""
    arr.each {|fish| longest_fish = fish if fish.length > longest_fish.length }
    longest_fish
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
               "left",  "left-up" ]

def slow_dance(move, arr)
    arr.each.with_index {|dir, i| return i if dir == move }
end

fast_tiles = { "up" => 0, "right-up" => 1, "right"=> 2, "right-down"=> 3, "down"=> 4, "left-down"=> 5, "left"=> 6, "left-up"=> 7 }

def constant_dance(move, hash)
    hash[move]
end

p constant_dance("right-down", fast_tiles)