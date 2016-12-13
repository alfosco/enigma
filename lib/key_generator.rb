require 'pry'

class KeyGenerator
  attr_reader   :number_pool, :key

  def initialize
    @number_pool  = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @key          = key
  end

  def key
    key = []
    5.times do
      key << number_pool.sample(1)
    end
    @key = key.join
  end

  def to_integer
    set_hash_values.map do |key, value|
      [key, value.to_i]
    end.to_h
  end

  def set_hash_values
    key = @key
    {"A" => key[0..1], "B" => key[1..2], "C" => key[2..3], "D" => key[3..4] }
  end

end
