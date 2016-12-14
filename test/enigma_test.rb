require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    e = Enigma.new
    assert_equal Enigma, e.class
    #assert_instance_of Enigma, e
  end

  def test_it_reads_a_file
  skip
    e = Enigma.new("message.txt", "r")
    assert_equal nil, e
    refute_equal nil, e.read
  end

  def test_it_writes_html
  skip
    e = Enigma.new("encrypted.txt", "w")
    assert_equal nil, e
    refute_equal nil, e.write
  end

end