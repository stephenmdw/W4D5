class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !self[key.hash].include?(key)
      self[key.hash] << key
      @count += 1
    end
    
    if @count > @num_buckets
      self.resize!
      self[key.hash] << key
      @count += 1 
    end
  end

  def include?(key)
    self[key.hash].include?(key) 
  end

  def remove(key)
    if self[key.hash].include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @num_buckets]
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
