require 'Date'

class OffsetGenerator
  attr_reader :date,
              :offset

  attr_accessor :offset_rotation

  def initialize
    @date             = Date.today
    @offset_rotation  = offset_rotation
    @offset           = offset
  end

  def format_date
    @date.strftime("%d%m%y").to_i
  end

  def square_date
    (format_date ** 2).to_s
  end

  def set_offset_hash_values
    a = square_date[-4].to_i
    b = square_date[-3].to_i
    c = square_date[-2].to_i
    d = square_date[-1].to_i
    @offset_rotation = {"A" => a, "B" => b, "C" => c, "D" => d}
  end
    #how to test that it's squaring?
    #can do a .length test once last numbers are pulled
end
