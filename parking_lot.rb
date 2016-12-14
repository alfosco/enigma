
  def test_extract_hash_sums_contains_array_of_sums
    encrypt = Encryption.new
    assert_equal Array, encrypt.extract_hash_sums.class
  end

  # def test_it_grabs_index_from_library_that_matches_letters
  #   encrypt = Encryption.new
  #   assert_equal
  # end

  def test_it_returns_encrypted_string
    encrypt = Encryption.new
    assert_equal 4, encrypt.find_start_index("lost").length
    assert_equal String, encrypt.find_start_index("lost").class
  end


  CHAR_MAP = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

    def extract_hash_sums
      hash_merge.map {|key, value| value}
    end

    def find_start_index(plain_text)
      plain_text_array = plain_text.chars
      count = 0
      start_indexes = []
      CHAR_MAP.each.with_index do |letter, index|
        until count == 4
          if letter == plain_text_array[0]#look through letters in array
          start_indexes << index
          end
          binding.pry
          count += 1
        end
      end
      start_indexes #four number array
      #binding.pry
    end

    def encrypt_message
      encrypted_array = []
      start_point = CHAR_MAP.rotate(find_start_index)
      start_point.rotate(extract_hash_sums[0])
      #encrypted_array.join is our encrypted message
    end
  >>>>>>> a982915c3426b1cae560af52887c06210ea35c8b
