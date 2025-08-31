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
  
  # Convertir keys a integers y ordenar numéricamente
  user_counts = user_counts.transform_keys(&:to_i)
  
  # Ordenar por la clave numérica y crear array ordenado
  sorted_array = user_counts.sort
  
  # Imprimir en el orden correcto
  sorted_array.each do |user_id, count|
    puts "#{user_id}: #{count}"
  end
end
