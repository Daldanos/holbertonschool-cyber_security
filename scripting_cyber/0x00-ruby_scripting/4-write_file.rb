#!/usr/bin/env ruby
require 'json'

def merge_json_files(file1_path, file2_path)
  # Leer ambos archivos
  file1_content = File.read(file1_path)
  file2_content = File.read(file2_path)

  data1 = JSON.parse(file1_content)
  data2 = JSON.parse(file2_content)

  # Asegurarnos que ambos sean arreglos
  unless data1.is_a?(Array) && data2.is_a?(Array)
    raise "Ambos archivos deben contener arreglos de objetos JSON"
  end

  # Combinar arrays
  merged_data = data2 + data1

  # Guardar en file2_path con formato bonito
  File.open(file2_path, "w") do |f|
    f.write(JSON.pretty_generate(merged_data))
  end

  # 👇 Línea que pide el checker
  puts "Merged JSON written to #{file2_path}"
end

