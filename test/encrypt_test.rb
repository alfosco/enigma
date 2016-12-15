require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def test_it_exists
    e = Encrypt.new
    assert_equal Encrypt, e.class
    #assert_instance_of Enigma, e
  end

  def test_it_reads_a_file
  skip
    e = Encrypt.new("message.txt", "r")
    assert_equal nil, e
    refute_equal nil, e.read
  end

  def test_it_writes_html
  skip
    e = Encrypt.new("encrypted.txt", "w")
    assert_equal nil, e
    refute_equal nil, e.write
  end

end