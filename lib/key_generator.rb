require 'pry'

class KeyGenerator
  attr_reader   :number_pool


  def initialize
    @number_pool = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def key
    number_pool.sample(5).join
  end

end

# kg = KeyGenerator.new
# puts kg.key
