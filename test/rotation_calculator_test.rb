require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotation_calculator'


class RotationCalculatorTest < Minitest::Test

  def test_it_exists
    calculate = RotationCalculator.new
    assert_equal RotationCalculator, calculate.class
    assert_instance_of RotationCalculator, calculate
  end

  def test_hash_1_and_2_are_hashes
    calculate = RotationCalculator.new
    assert_equal Hash, calculate.hash_1.class
    assert_equal Hash, calculate.hash_2.class
  end

  def test_hash_1_values_are_integers_and_have_two_integers
    calculate = RotationCalculator.new
    hash_1  = calculate.hash_1
    assert_equal Fixnum, hash_1["A"].class
    assert_equal Fixnum, hash_1["B"].class
    assert_equal Fixnum, hash_1["C"].class
    assert_equal Fixnum, hash_1["D"].class
  end

  def test_hash_2_values_are_integers_and_have_one_integer
    calculate = RotationCalculator.new
    hash_2  = calculate.hash_2
    assert_equal Fixnum, hash_2["A"].class
    assert_equal Fixnum, hash_2["B"].class
    assert_equal Fixnum, hash_2["C"].class
    assert_equal Fixnum, hash_2["D"].class
    assert_equal 1, hash_2["A"].to_s.length
    assert_equal 1, hash_2["B"].to_s.length
    assert_equal 1, hash_2["C"].to_s.length
    assert_equal 1, hash_2["D"].to_s.length
  end

  def test_encryption_rotations_contains_sum_of_key_and_offset_rotations
    calculate     = RotationCalculator.new
    rot_sums    = calculate.hash_merge
    key_rots    = calculate.hash_1
    offset_rots = calculate.hash_2
    assert offset_rots["A"] == (rot_sums["A"]) - (key_rots["A"])
    assert offset_rots["B"] == (rot_sums["B"]) - (key_rots["B"])
    assert offset_rots["C"] == (rot_sums["C"]) - (key_rots["C"])
    assert offset_rots["D"] == (rot_sums["D"]) - (key_rots["D"])
  end

end
