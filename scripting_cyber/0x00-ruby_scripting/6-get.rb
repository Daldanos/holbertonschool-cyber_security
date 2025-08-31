#!/usr/bin/env ruby
# Simple HTTP GET request for Holberton School

require 'net/http'
require 'uri'
require 'json'

def get_request(url)
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = (uri.scheme == 'https')
  
  request = Net::HTTP::Get.new(uri.request_uri)
  
  response = http.request(request)
  
  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"
  
  # Pretty print JSON if the response is JSON
  if response['content-type']&.include?('application/json')
    parsed_json = JSON.parse(response.body)
    puts JSON.pretty_generate(parsed_json)
  else
    puts response.body
  end
end
