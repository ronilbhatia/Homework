class LRUCache
  def initialize(capacity)
    @cache = []
    @capacity = capacity
  end

  def count
    @cache.count
  end

  def add(el)
    @cache.delete(el) if include?(el)
    @cache.pop if full? && !include?(el)
    @cache.unshift(el)
  end

  def show
    puts @cache
  end

  private

  def include?(el)
    @cache.include?(el)
  end

  def full?
    count == @capacity
  end
end
