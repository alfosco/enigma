require './lib/decrypt_machine'
require 'Date'
require 'pry'

class Decrypt

  def initialize
    @date = Date.today.strftime("%d%m%y").to_i
  end

  def read_file
    handle = File.open(ARGV[0], "r")
    @plain_text = handle.read
    handle.close
  end

  def write_file
    decryptor = DecryptMachine.new(@plain_text, ARGV[2])
    # binding.pry
    decrypted_text = decryptor.decryption_rotator#put here- method that decrypts
    writer = File.open(ARGV[1], "w")
    writer.write(decrypted_text)
    writer.close
  end

  def return_message
    puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{@date}"
  end

end

d = Decrypt.new
d.read_file
d.write_file
d.return_message