#password.rb

require_relative 'PasswordCracker'

pc = PasswordCracker.new

puts "Hello! Welcome to the Fallout password helper."

(1..4).each { |try|

  puts "Enter password try #{try}: "
  password_guess = gets.chomp

  puts "Input how many letters it got correct: "
  correct_chars = gets.chomp

  pc.enter_password(password_guess, correct_chars)

  while true do
    puts "Enter a password to try: "
    password_try = gets.chomp
    success = pc.try_password(password_try)

    if success then
      puts "Success. Try the password #{password_try}"
      break
    end
    puts "No good. Try again"

  end

  }
