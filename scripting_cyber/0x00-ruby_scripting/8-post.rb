#!/usr/bin/env ruby
# HTTP POST request for Holberton School

require 'net/http'
require 'uri'
require 'json'

def post_request(url, body_params)
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = (uri.scheme == 'https')
  
  request = Net::HTTP::Post.new(uri.request_uri)
  request['Content-Type'] = 'application/json'
  request.body = body_params.to_json
  
  response = http.request(request)
  
  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"
  
  # Pretty print JSON response
  if response['content-type']&.include?('application/json')
    parsed_json = JSON.parse(response.body)
    puts JSON.pretty_generate(parsed_json)
  else
    puts response.body
  end
end
