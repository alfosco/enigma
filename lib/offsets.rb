require_relative 'key_generator'
require 'Date'

class Offset
  attr_reader :date

  def initialize
    @date = Date.today
  end

    def date_squared
      date_formatted  = @date.strftime("%m%d%y").to_i
      date_squared    = (date_formatted ** 2).to_s
      date_squared
    end

    #still need to grab the last 5 digits to make the hash
    #how to test that it's squaring?
    #can do a .length test once last numbers are pulled
    
end
