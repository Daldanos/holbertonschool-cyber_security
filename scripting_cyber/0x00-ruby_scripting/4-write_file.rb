#!/usr/bin/env ruby
# Merge JSON files for Holberton School

require 'json'

def merge_json_files(file1_path, file2_path)
  # Read and parse first JSON file
  file1_content = File.read(file1_path)
  data1 = JSON.parse(file1_content)
  
  # Read and parse second JSON file
  file2_content = File.read(file2_path)
  data2 = JSON.parse(file2_content)
  
  # Merge the data (assuming both are arrays)
  merged_data = data1 + data2
  
  # Write merged data back to file2
  File.write(file2_path, JSON.pretty_generate(merged_data))
end
