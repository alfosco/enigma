require 'minitest/autorun'
require 'minitest/pride'
require './lib/Encrypt'

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypt = Encrypt.new

    assert_equal Encrypt, encrypt.class
    assert_instance_of Encrypt, encrypt
  end

  def test_char_map_is_array
    encrypt = Encrypt.new
    assert_equal Array, encrypt.char_map.class
  end

  def test_rotate_a_rotates_correctly
    encrypt = Encrypt.new

    char_map = encrypt.char_map
    encrypt.rotation_values["A"] = 49
    assert_equal "q", encrypt.rotate_a("g")
  end

  def test_encryption_rotator_can_encrypt_message
    encrypt = Encrypt.new
    incoming_text = "this is a test"
    encrypt.rotation_values["A"] = 10
    encrypt.rotation_values["B"] = 34
    encrypt.rotation_values["C"] = 86
    encrypt.rotation_values["D"] = 23

    assert_equal "3cqchd0uk5112o", encrypt.encryption_rotator(incoming_text)
  end
end
