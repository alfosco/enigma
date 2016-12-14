require 'pry'
require_relative 'key_generator'
require_relative 'offset_generator'

class Encryption

CHAR_MAP = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

  def initialize
    @key    = KeyGenerator.new
    @offset = OffsetGenerator.new
  end

  def hash_1
    @key.to_integer
  end

  def hash_2
    @offset.set_offset_hash_values
  end

  def hash_merge
    hash_1.merge(hash_2) do |hash_key, key_rotations, offset_rotations|
      key_rotations + offset_rotations
    end
  end

  def extract_hash_sums
    hash_merge.map {|key, value| value}
  end

  def find_start_index(plain_text)
    plain_text_array = plain_text.chars
    count = 0
    start_indexes = []
    CHAR_MAP.each.with_index do |letter, index|
      until count == 4 
        if letter == plain_text_array[count]#look through letters in array
        start_indexes << index
        end
        binding.pry
        count += 1
      end
    end
    start_indexes #four number array
    #binding.pry
  end

  def encrypt_message
    encrypted_array = []
    start_point = CHAR_MAP.rotate(find_start_index)
    start_point.rotate(extract_hash_sums[0])
    #encrypted_array.join is our encrypted message
  end

end
