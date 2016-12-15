#require 'simplecov'
#SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt_machine'

class EncryptMachineTest < Minitest::Test

  def test_it_exists
    e = EncryptMachine.new

    assert_equal EncryptMachine, e.class
    assert_instance_of EncryptMachine, e
  end

  def test_char_map_is_array
    e = EncryptMachine.new
    assert_equal Array, e.char_map.class
  end

  def test_rotate_a_rotates_correctly
    e = EncryptMachine.new

    char_map = e.char_map
    e.rotation_values["A"] = 49
    assert_equal "q", e.rotate_a("g")
  end

  def test_encryption_rotator_can_encrypt_message
    e = EncryptMachine.new
    incoming_text = "this is a test"
    e.rotation_values["A"] = 10
    e.rotation_values["B"] = 34
    e.rotation_values["C"] = 86
    e.rotation_values["D"] = 23

    assert_equal "3cqchd0uk5112o", e.encrypt(incoming_text)
  end
end
