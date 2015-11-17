#PasswordCracker.rb

class PasswordCracker

  def initialize
    @passwords = Hash.new
    @password_size = 0
  end

  def enter_password (password, correct)
    @password_size = password.size if @password_size == 0
    raise "length of password #{password} is #{password.size}, expected: #{@password_size}" if password.size != @password_size
    @passwords[password] = correct
  end

  def try_password (password)
    @passwords.each { |guess, expected|
      actual = similar_chars(guess, password).to_i
      puts "#{guess} | Expected: #{expected} | Actual: #{actual}"
      return false if actual != expected.to_i
    }
    return true
  end

  def similar_chars (guess, password)
    raise "passwords not same size" if guess.size != password.size
    correct = 0
    (0..guess.size-1).each { |i| correct += 1 if guess.chars[i] == password.chars[i] }
    return correct
  end

end
