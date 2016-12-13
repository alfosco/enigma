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
      key << number_pool.sample(1)
    end
    key.join
  end

  # def to_integer
  #   key.set_hash_values
  #   key_rotation = @key_rotation
  #   key_rotation = @key_rotation.map do |key, value|
  #     [key, value.to_i]
  #   end.to_h
  #   # binding.pry
  # end

  def set_hash_values
    key = @key
    a = key[0..1].to_i
    b = key[1..2].to_i
    c = key[2..3].to_i
    d = key[3..4].to_i
    @key_rotation = {"A" => a, "B" => b, "C" => c, "D"=> d }
  end

end
