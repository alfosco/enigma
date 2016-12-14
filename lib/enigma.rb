require './lib/encrypt'

class Enigma

  def read_file
    handle = File.open(ARGV[0], "r")
    @plain_text = handle.read.downcase
    handle.close
  end

  def write_file
    encryptor = Encrypt.new
    encrypted_text = encryptor.encryption_rotator(@plain_text)#put here- method that encrypts
    writer = File.open(ARGV[1], "w")
    writer.write(encrypted_text)
    writer.close
  end

end
