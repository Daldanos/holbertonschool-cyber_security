#!/usr/bin/env ruby
require 'json'

def count_user_ids(path)
  # Leer el archivo y parsear el JSON
  file_content = File.read(path)
  data = JSON.parse(file_content)

  # Contar ocurrencias de cada userId
  counts = Hash.new(0)
  data.each do |entry|
    counts[entry["userId"]] += 1
  end

  # Mostrar en el formato esperado
  counts.keys.sort.each do |user_id|
    puts "#{user_id}: #{counts[user_id]}"
  end
end

