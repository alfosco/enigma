require_relative 'encrypt_machine'
require_relative 'rotation_calculator'
require 'pry'

# need encrypt in order to access the correct rotation values

class DecryptMachine
  attr_reader :char_map, :rotation_values, :encrypted_message
  # attr_accessor

  def initialize(encrypted_message, decrypt_key = 00000)
    @char_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
      "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    @offset = OffsetGenerator.new
    @encrypted_message = encrypted_message
    @decrypt_key = decrypt_key
  end


  def decryption_rotator
    count = 0
    message_array = @encrypted_message.chars
    #binding.pry
    decrypted_message =  message_array.map do |character|
        if count == 0
          count += 1
          reverse_a(character)
        elsif count == 1
          count+= 1
          reverse_b(character)
        elsif count == 2
          count += 1
          reverse_c(character)
        else
          count = 0
          reverse_d(character)
        end
      end
    decrypted_message.join
  end

  def set_hash_values_two
    key = @decrypt_key
    {"A" => key[0..1], "B" => key[1..2], "C" => key[2..3], "D" => key[3..4] }
  end

 def hash_1_two
    set_hash_values_two.map do |key, value|
      [key, value.to_i]
    end.to_h
  end

  def hash_2_two
    @offset.set_offset_hash_values
  end

  def rotation_values_two
    hash_1_two.merge(hash_2_two) do |hash_key, key_rotations, offset_rotations|
      key_rotations + offset_rotations
    end
  end

  def reverse_a(character)
    start_index = char_map.index(character)
    binding.pry
    value       = (rotation_values_two["A"] - start_index) * -1
    char_map.rotate(value)[0]
  end

  def reverse_b(character)
    start_index = char_map.index(character)
    value       = (rotation_values_two["B"] - start_index) * -1
    char_map.rotate(value)[0]
  end

  def reverse_c(character)
    start_index = char_map.index(character)
    value       =  (rotation_values_two["C"] - start_index) * -1
    char_map.rotate(value)[0]
  end

  def reverse_d(character)
    start_index = char_map.index(character)
    value       =  (rotation_values_two["D"] - start_index) * -1
    char_map.rotate(value)[0]
  end

end
