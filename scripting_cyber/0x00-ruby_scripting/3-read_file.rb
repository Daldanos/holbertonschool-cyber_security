#!/usr/bin/env ruby
# Read JSON file and count user IDs for Holberton School

require 'json'

def count_user_ids(path)
  # Read and parse JSON file
  file = File.read(path)
  data = JSON.parse(file)
  
  # Count user IDs
  user_counts = Hash.new(0)
  
  data.each do |item|
    user_id = item['userId']
    user_counts[user_id] += 1 if user_id
  end
  
  # Print results sorted by user ID
  user_counts.sort.each do |user_id, count|
    puts "#{user_id}: #{count}"
  end
end
