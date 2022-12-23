class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  attr_reader :store

  def insert(num)
    if num >= @max || num < 0
      raise 'Out of bounds'
    else
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    # @store.include?(num)
    return true if @store[num] == true 
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].pop
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self[num].include?(num)  
      self[num] << num
      @count += 1
    end

    if @count > @num_buckets
      self.resize!
      self[num] << num
      @count += 1 
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num) 
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    dupStore = @store.dup
    @num_buckets *= 2
    newStore = Array.new(@num_buckets) { Array.new }
    self.store = newStore
    @count = 0
    dupStore.each do |bucket|
      # bucket.each do |ele|
        
      self.insert(bucket[0])
    end
  end
  
end
