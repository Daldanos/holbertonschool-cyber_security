#!/usr/bin/env ruby
# Read JSON file and count user IDs for Holberton School

require 'json'

def count_user_ids(path)
  # Read and parse JSON file
  file = File.read(path)
  data = JSON.parse(file)
  
  # Count user IDs y convertir a integer inmediatamente
  user_counts = {}
  
  data.each do |item|
    if item['userId']
      user_id = item['userId'].to_i
      user_counts[user_id] ||= 0
      user_counts[user_id] += 1
    end
  end
  
  # Obtener keys ordenadas numéricamente
  sorted_keys = user_counts.keys.sort
  
  # Imprimir en orden numérico
  sorted_keys.each do |user_id|
    puts "#{user_id}: #{user_counts[user_id]}"
  end
end
