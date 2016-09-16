class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    set = false
    @map.each do |pair|
      if pair[0] == key
        pair[1] = value
        set = true
      end
    end
    @map << [key, value] if set == false
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def remove(key)
    @map.each { |pair| @map.delete(pair) if pair[0] == key }
  end

  def show
    @map.dup
  end
end
