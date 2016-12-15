require_relative 'encrypt_machine'
require_relative 'rotation_calculator'

# need encrypt in order to access the correct rotation values

class DecryptMachine
  attr_reader :char_map, :rotation_values
  # attr_accessor

  def initialize
    @char_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
      "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    @rotation_values = RotationCalculator.new.rotation_values
  end


  def decryption_rotator(decrypted_message)
    count = 0
    message_array = decrypted_message.chars
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

  def reverse_a(character)
    start_index = char_map.index(character)
    value       = rotation_values["A"] - start_index
    char_map.rotate(-value)[0]
  end

  def reverse_b(character)
    start_index = char_map.index(character)
    value       = rotation_values["B"] - start_index
    char_map.rotate(-value)[0]
  end

  def reverse_c(character)
    start_index = char_map.index(character)
    value       =  rotation_values["C"] - start_index
    char_map.rotate(-value)[0]
  end

  def reverse_d(character)
    start_index = char_map.index(character)
    value       =  rotation_values["D"] - start_index
    char_map.rotate(-value)[0]
  end

end
