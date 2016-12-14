require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_generator'
require 'pry'


class OffsetGeneratorTest < Minitest::Test
  def test_it_exists
    offset = OffsetGenerator.new
    assert_equal OffsetGenerator, offset.class
    assert_instance_of OffsetGenerator, offset
  end
  def test_date_class
    offset = OffsetGenerator.new
    assert_equal Date, offset.date.class
  end
  def test_date_is_todays_date
    offset = OffsetGenerator.new
    assert_equal Date.today, offset.date
  end
  def test_date_format_is_DDMMYY
    offset = OffsetGenerator.new


    # assert_equal "2016-12-13", Date.today.strftime
    assert_equal 141216, offset.format_date
  end
  # def test_it_squares_date_and_returns_string
  #   offset = OffsetGenerator.new
  #   031415 = offset.format_date
  #   assert_equal "17217638656", offset.square_date
  #   assert String, offset.square_date.class
  # end
  def test_it_creates_hash_with_values_as_last_four_digits_of_squared_date
    offset = OffsetGenerator.new
    last_four = offset.square_date[-4..-1]
    offset.set_offset_hash_values
    assert_equal last_four[0], offset.offset_rotation["A"].to_s
    assert_equal last_four[1], offset.offset_rotation["B"].to_s
    assert_equal last_four[2], offset.offset_rotation["C"].to_s
    assert_equal last_four[3], offset.offset_rotation["D"].to_s
  end
end
