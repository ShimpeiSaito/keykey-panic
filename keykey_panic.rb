# frozen_string_literal: true

class KeyKeyPanic
  def initialize
    rand_char
  end

  def rand_char
    char_list = [*('0'..'9'), *('a'..'z')]
    @bomb_char = char_list[rand(char_list.length)]
  end

  def get_bomb_char
    @bomb_char
  end

  # @param [String] char
  # @return [TrueClass, FalseClass]
  def bomb_check(char)
    char.eql? @bomb_char
  end
end


kp = KeyKeyPanic.new
pressed_keys = []

puts 'Press any key!'

loop do
  input = gets.chomp

  if input.eql? 'exit'
    puts 'See you again👋'
    exit
  end

  if input.match(/\A[a-z0-9]$/).nil? || pressed_keys.include?(input)
    puts 'Error... Press key again.'
    next
  end

  if kp.bomb_check(input)
    system('afplay /System/Library/Sounds/Hero.aiff')
    puts '💣Kaboom!!!!!'
    puts '-----GAME OVER-----'
    exit
  end

  pressed_keys.append(input)

  puts 'Safe. Press any key!'
  # puts kp.get_bomb_char
end
