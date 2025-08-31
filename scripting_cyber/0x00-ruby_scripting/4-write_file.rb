#!/usr/bin/env ruby
# Merge JSON files for Holberton School

require 'json'

def merge_json_files(file1_path, file2_path)
  # Read and parse both JSON files
  data1 = JSON.parse(File.read(file1_path))
  data2 = JSON.parse(File.read(file2_path))
  
  # Merge the data
  merged_data = data1 + data2
  
  # Write merged data back to file2
  File.write(file2_path, JSON.generate(merged_data))
  
  # Print the required message
  puts "Merged JSON written to #{file2_path}"
end
