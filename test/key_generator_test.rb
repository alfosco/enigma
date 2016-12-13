require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'
require 'pry'

class KeyGeneratorTest < Minitest::Test

  def test_it_exists
    kg = KeyGenerator.new
    assert_equal KeyGenerator, kg.class
    assert_instance_of KeyGenerator, kg
  end

  def test_number_pool_default
    kg = KeyGenerator.new
    assert_equal [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], kg.number_pool
  end

  def test_key_generates_5_unique_digits
    kg = KeyGenerator.new
    kg_2  = KeyGenerator.new
    key_1 = kg.key
    key_2 = kg_2.key

    assert_equal 5, kg.key.length
    refute key_1 == key_2
  end

  def test_key_rotation_values_are_2_fixnumbs
    kg = KeyGenerator.new
    kg.key
    kg.set_hash_values
    kg.to_integer
    assert_equal Fixnum, kg.key_rotation["A"].class
    assert_equal 2, kg.key_rotation["A"].to_s.length
  end

  # def test_last_value_of_rotation_A_same_as_first_value_of_rotation_B
  #   kg = KeyGenerator.new
  #   kg.key
  #   kg.set_hash_values
  #   key_rot = kg.to_integer
  #   key_rot_a = key_rot["A"].to_s
  #   key_rot_b = key_rot["B"].to_s
  #   assert key_rot_a[1] == key_rot_b[0]
  # end
  #
  # def test_last_value_of_rotation_B_same_as_first_value_of_rotation_C
  #   kg = KeyGenerator.new
  #   kg.key
  #   kg.set_hash_values
  #   key_rot = kg.to_integer
  #   key_rot_b = key_rot["B"].to_s
  #   key_rot_c = key_rot["C"].to_s
  #   assert key_rot_b[1] == key_rot_c[0]
  # end
  #
  # def test_last_value_of_rotation_C_same_as_first_value_of_rotation_D
  #   kg = KeyGenerator.new
  #   kg.key
  #   kg.set_hash_values
  #   key_rot = kg.to_integer
  #   key_rot_c = key_rot["C"].to_s
  #   key_rot_d = key_rot["D"].to_s
  #   assert key_rot_c[1] == key_rot_d[0]
  # end


end
