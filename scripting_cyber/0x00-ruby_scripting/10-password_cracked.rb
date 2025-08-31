#!/usr/bin/env ruby
# Password cracker for Holberton School

require 'digest'

# Check command line arguments
if ARGV.length != 2
  puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
  exit(1)
end

hashed_password = ARGV[0]
dictionary_file = ARGV[1]

begin
  # Read dictionary file
  words = File.readlines(dictionary_file).map(&:chomp)
  
  # Try each word in the dictionary
  found = false
  words.each do |word|
    # Calculate SHA-256 hash of the word
    hash = Digest::SHA256.hexdigest(word)
    
    if hash == hashed_password
      puts "Password found: #{word}"
      found = true
      break
    end
  end
  
  puts "Password not found in dictionary." unless found

rescue Errno::ENOENT
  puts "Error: Dictionary file not found."
  exit(1)
rescue StandardError => e
  puts "Error: #{e.message}"
  exit(1)
end
