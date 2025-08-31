#!/usr/bin/env ruby
# Read JSON file and count user IDs for Holberton School

require 'json'

def count_user_ids(path)
  # Read and parse JSON file
  file = File.read(path)
  data = JSON.parse(file)
  
  # Count user IDs - asegurando que son integers
  user_counts = Hash.new(0)
  
  data.each do |item|
    user_id = item['userId']
    user_counts[user_id.to_i] += 1 if user_id
  end
  
  # Ordenar numéricamente por la clave (user_id)
  sorted_counts = user_counts.sort_by { |user_id, _| user_id }
  
  # Imprimir en el orden correcto
  sorted_counts.each do |user_id, count|
    puts "#{user_id}: #{count}"
  end
end
