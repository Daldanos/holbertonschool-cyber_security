#!/usr/bin/env ruby
# File downloader for Holberton School

require 'open-uri'
require 'fileutils'

# Check command line arguments
if ARGV.length != 2
  puts "Usage: 9-download_file.rb URL LOCAL_FILE_PATH"
  exit(1)
end

url = ARGV[0]
local_path = ARGV[1]

begin
  puts "Downloading file from #{url}..."
  
  # Download the file
  download = URI.open(url)
  
  # Save to local file
  FileUtils.mkdir_p(File.dirname(local_path))
  File.binwrite(local_path, download.read)
  
  puts "File downloaded and saved to #{local_path}."
  
rescue StandardError => e
  puts "Error: #{e.message}"
  exit(1)
end
