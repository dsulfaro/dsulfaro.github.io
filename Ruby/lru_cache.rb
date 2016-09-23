class LRUCache
  def initialize(size=4)
    @size = size
    @cache = Array.new(4)

  end

  def count
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @cache.include?(el)
      to_end(@cache.index(el))
    else
      @cache.shift if count == @size
      @cache << el
    end
  end

  def show
    print @cache
  end

  private

  attr_reader :size, :cache

  def to_end(idx)
    @cache.insert(@cache.length - 1, @cache.delete_at(idx))
  end

end
