tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles_array)
  tiles_array.each_with_index do |tile, i|
    return i if dir == tile
  end
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

tiles_hash = {
  up: 0,
  rightup: 1,
  right: 2,
  rightdown: 3,
  down: 4,
  leftdown: 5,
  left: 6,
  leftup: 7
}

def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end

p fast_dance(:up, tiles_hash)
p fast_dance(:rightdown, tiles_hash)
