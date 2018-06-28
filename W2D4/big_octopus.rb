fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(arr)
  fish_comparisons = Hash.new(0)
  longest_fish = nil

  arr.each_with_index do |fish1, i|
    length1 = fish1.length
    arr[i+1..-1].each do |fish2|
      length2 = fish2.length
      length1 > length2 ? fish_comparisons[fish1] += 1 : fish_comparisons[fish2] += 1
    end
  end

  most_wins = 0
  fish_comparisons.each do |k, v|
    longest_fish = k if v > most_wins
  end

  longest_fish
end

p sluggish_octopus(fish)

def dominant_octopus(arr)
  merge_sort(arr).first
end

def merge_sort(arr)
  return arr if arr.length <= 1
  mid_idx = arr.length/2

  left = merge_sort(arr.take(mid_idx))
  right = merge_sort(arr.drop(mid_idx))

  merge(left, right)
end

def merge(left, right)
  result = []

  until left.empty? || right.empty?
    left[0].length > right[0].length ? result << left.shift : result << right.shift
  end

  result + left + right
end

p dominant_octopus(fish)

def clever_octopus(arr)
  longest_fish = arr[0]
  arr[1..-1].each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end

  longest_fish
end

p clever_octopus(fish)
