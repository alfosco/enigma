require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption'


class EncryptionTest < Minitest::Test

  def test_it_exists
    encrypt = Encryption.new
    assert_equal Encryption, encrypt.class
    assert_instance_of Encryption, encrypt
  end

  def test_hash_1_and_2_are_hashes
    encrypt = Encryption.new
    assert_equal Hash, encrypt.hash_1.class
    assert_equal Hash, encrypt.hash_2.class
  end

  def test_hash_1_values_are_integers_and_have_two_integers
    encrypt = Encryption.new
    hash_1  = encrypt.hash_1
    assert_equal Fixnum, hash_1["A"].class
    assert_equal Fixnum, hash_1["B"].class
    assert_equal Fixnum, hash_1["C"].class
    assert_equal Fixnum, hash_1["D"].class
  end

  def test_hash_2_values_are_integers_and_have_one_integer
    encrypt = Encryption.new
    hash_2  = encrypt.hash_2
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
    encrypt     = Encryption.new
    rot_sums    = encrypt.hash_merge
    key_rots    = encrypt.hash_1
    offset_rots = encrypt.hash_2
    assert offset_rots["A"] == (rot_sums["A"]) - (key_rots["A"])
    assert offset_rots["B"] == (rot_sums["B"]) - (key_rots["B"])
    assert offset_rots["C"] == (rot_sums["C"]) - (key_rots["C"])
    assert offset_rots["D"] == (rot_sums["D"]) - (key_rots["D"])
  end



end
