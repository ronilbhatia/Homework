class Map
  def initialize
    @map = []
  end

  def set(key, value)
    includes = false
    key_idx = nil
    @map.each_with_index do |el, i|
      if el[0] == key
        includes = true
        key_idx = i
      end
    end

    if includes
      @map[key_idx][1] = value
    else
      @map << [key, value]
    end
  end

  def get(key)
    @map.each do |el|
      return el[1] if el[0] == key
    end

    nil
  end

  def delete(key)
    @map.each_with_index do |el, i|
      @map = @map[0...i] + @map[i+1...@map.length] if el[0] == key
    end

    @map
  end

  def show
    deep_dup(@map)
  end

  private

  attr_reader :map

  def deep_dup(arr)
    arr.map { |el| el.class == Array ? deep_dup(el) : el }
  end
end
