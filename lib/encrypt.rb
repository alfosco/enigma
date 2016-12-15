require './lib/encrypt_machine'
require './lib/rotation_calculator'
require 'Date'
require 'pry'

class Encrypt

  def initialize
    @date = Date.today.strftime("%d%m%y").to_i
  end

  def read_file
    handle = File.open(ARGV[0], "r")
    @plain_text = handle.read.downcase
    handle.close
  end

  def write_file
    encryptor = EncryptMachine.new
    encrypted_text = encryptor.encryption_rotator(@plain_text)#put here- method that encrypts
    writer = File.open(ARGV[1], "w")
    writer.write(encrypted_text)
    writer.close
  end

  def return_message
    puts "Created '#{ARGV[1]}' with the key and date #{@date}"
  end

end

e = Encrypt.new
e.read_file
e.write_file
e.return_message
