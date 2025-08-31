#!/usr/bin/env ruby
# Prime Number Checker for Holberton School

def prime(number)
  return false if number < 2
  
  (2..Math.sqrt(number).to_i).each do |i|
    return false if number % i == 0
  end
  
  true
end
