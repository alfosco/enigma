require 'minitest/autorun'
require 'minitest/pride'
require './lib/Decrypt'

class DecryptTest < Minitest::Test

  def test_it_exists
    decrypt = Decrypt.new

    assert_equal Decrypt, decrypt.class
    assert_instance_of Decrypt, decrypt
  end

  def test_reverse_a_rotates_correctly
    decrypt = Decrypt.new


    char_map = decrypt.char_map
    decrypt.rotation_values["A"] = 49

    assert_equal "g", decrypt.reverse_a("q")
  end

  def test_decryption_rotator_can_decrypt
    decrypt = Decrypt.new
    encrypted_text = "3cqchd0uk5112o"
    decrypt.rotation_values["A"] = 10
    decrypt.rotation_values["B"] = 34
    decrypt.rotation_values["C"] = 86
    decrypt.rotation_values["D"] = 23

    assert_equal "this is a test", decrypt.decryption_rotator(encrypted_text)
  end

end
