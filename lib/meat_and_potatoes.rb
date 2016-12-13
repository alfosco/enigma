require 'pry'
require_relative 'key_generator'
require_relative 'offset_generator'

class Encryption
attr_accessor :encryption_rotations
# attr_reader

  def initialize
    @key                  = KeyGenerator.new
    @offset               = OffsetGenerator.new
    @encryption_rotations = encryption_rotations
  end

  def hash_1
    @key.set_hash_values
  end

  def hash_2
    @offset.set_offset_hash_values
  end

  def hash_merge
    @encryption_rotations = hash_1.merge(hash_2) do |hash_key, key_rotations, offset_rotations|
      key_rotations + offset_rotations
    end
  end

end
