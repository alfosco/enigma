require 'pry'
require_relative 'key_generator'
require_relative 'offset_generator'

class RotationCalculator
attr_accessor :rotation_values
attr_reader :get_key

  def initialize
    @key    = KeyGenerator.new
    @offset = OffsetGenerator.new
    @rotation_values = rotation_values
    #@get_key = get_key
  end

  def hash_1
    @key.to_integer
  end

  def hash_2
    @offset.set_offset_hash_values
  end

  def rotation_values
    hash_1.merge(hash_2) do |hash_key, key_rotations, offset_rotations|
      key_rotations + offset_rotations
    end
  end

end
