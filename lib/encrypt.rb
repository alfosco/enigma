require_relative 'rotation_calculator'

class Encrypt
  attr_reader :char_map, :rotation_values
  # attr_accessor

  def initialize
    @char_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
      "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    @rotation_values = RotationCalculator.new.rotation_values
  end


  def encryption_rotator(plain_message)
    count = 0
    message_array = plain_message.chars
    encrypted_message =  message_array.map do |character|
        if count == 0
          count += 1
          rotate_a(character)
        elsif count == 1
          count+= 1
          rotate_b(character)
        elsif count == 2
          count += 1
          rotate_c(character)
        else
          count = 0
          rotate_d(character)
        end
      end
    encrypted_message.join
  end

  def rotate_a(character)
    # letter from message
    # start index for char_map
    # char_map
    # Rotate A Value
    start_index = char_map.index(character) #character has to be a string
    value =  start_index + rotation_values["A"]
    char_map.rotate(value)[0]
  end

  def rotate_b(character)
    start_index = char_map.index(character) #character has to be a string
    value =  start_index + rotation_values["B"]
    char_map.rotate(value)[0]
  end

  def rotate_c(character)
    start_index = char_map.index(character) #character has to be a string
    value =  start_index + rotation_values["C"]
    char_map.rotate(value)[0]
  end

  def rotate_d(character)
    start_index = char_map.index(character) #character has to be a string
    value =  start_index + rotation_values["D"]
    char_map.rotate(value)[0]
  end

end
