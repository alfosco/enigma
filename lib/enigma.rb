class Enigma

  def encyrpt(message)
    EncryptMachine.new.encyrpt(message)
  end

  def decyrpt(message, key)
    DecryptMachine.new(message, key)
  end

end