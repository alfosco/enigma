require 'minitest/autorun'
require 'minitest/pride'
require './lib/offsets'
require 'pry'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new
    assert_equal Offset, offset.class
    assert_instance_of Offset, offset
  end

  def test_date_class
    offset = Offset.new
    assert_equal Date, offset.date.class
  end

  def test_date_squared
    offset = Offset.new
    assert_equal Date.today, offset.date
  end
end
