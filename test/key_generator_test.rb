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

  def test_key_rotations
    kg = KeyGenerator.new
    kg.key
    kg.set_hash_values
    kg.to_integer
    #binding.pry

    assert_equal Fixnum, kg.key_rotation["A"].class
    assert_equal 2, kg.key_rotation["A"].to_s.length
    #assert_equal  @key[0..1].to_i, key_rotation["A"]
    # assert_equal @key[1..2].to_i, rotation["B"]
    # assert_equal @key[2..3].to_i, rotation["C"]
    # assert_equal @key[3..4].to_i, rotation["D"]
  end


end
