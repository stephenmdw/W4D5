require 'byebug'
class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hashnum = []
    self.each_with_index do |ele, i|
      hashnum << ele.hash + i.hash
    end
    hashnum.sum * self.length
  end
end

class String
  def hash
    str = 0
    self.each_char.with_index do |char, i|
      # debugger
      str += char.ord.hash * i.hash
    end
    str * self.length
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = []
    self.each do |h, k|
      arr << h.hash * k.hash
    end
    arr.sum
  end
end
