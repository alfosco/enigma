require 'pry'

class KeyGenerator
  attr_reader   :number_pool, :key
  attr_accessor :key_rotation


  def initialize
    @number_pool  = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @key_rotation = key_rotation
    @key          = key
  end

  def key
    key = []
    5.times do
      key << number_pool.sample
    end
    key.join
  end

  def to_integer
    @key_rotation = @key_rotation.map do |key, value|
      [key, value.to_i]
    end.to_h
    # binding.pry
  end

  def set_hash_values
    key = @key
    @key_rotation = {"A" => key[0..1], "B" => key[1..2], "C" => key[2..3], "D" => key[3..4]}
  end

end
