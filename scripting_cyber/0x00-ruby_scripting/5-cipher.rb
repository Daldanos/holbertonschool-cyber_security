#!/usr/bin/env ruby
# Caesar Cipher implementation for Holberton School

class CaesarCipher
  def initialize(shift)
    @shift = shift
  end

  def encrypt(message)
    cipher(message, @shift)
  end

  def decrypt(message)
    cipher(message, -@shift)
  end

  private

  def cipher(message, shift)
    result = ""
    
    message.each_char do |char|
      if char.match(/[a-zA-Z]/)
        base = char.downcase == char ? 'a'.ord : 'A'.ord
        shifted_char = ((char.ord - base + shift) % 26 + base).chr
        result += shifted_char
      else
        result += char
      end
    end
    
    result
  end
end
