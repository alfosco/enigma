require 'simplecov'
SimpleCov.start

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
    assert_equal 2, kg.set_hash_values["A"].length
    assert_equal Fixnum, kg.to_integer["A"].class
    assert_equal 2, kg.set_hash_values["B"].length
    assert_equal Fixnum, kg.to_integer["B"].class
    assert_equal 2, kg.set_hash_values["C"].length
    assert_equal Fixnum, kg.to_integer["C"].class
    assert_equal 2, kg.set_hash_values["D"].length
    assert_equal Fixnum, kg.to_integer["D"].class
  end


end
