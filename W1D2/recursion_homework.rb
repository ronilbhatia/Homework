def sum_to(n)
  return nil if n < 0
  return n if n <= 1
  n + sum_to(n-1)
end

def add_numbers(nums_array)
  return nil if nums_array.length == 0
  return nums_array[0] if nums_array.length == 1
  add_numbers(nums_array[1..-1]) + nums_array[0]
end

def gamma_fnc(num)
  return nil if num - 1 < 0
  return 1 if num - 1 == 0
  (num-1) * gamma_fnc(num-1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.length == 0
  return true if flavors[0] == favorite
  has_favorite_flavor = ice_cream_shop(flavors[1..-1], favorite)
  has_favorite_flavor
end

def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0...-1])
end
