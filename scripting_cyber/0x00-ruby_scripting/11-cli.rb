#!/usr/bin/env ruby
# Basic CLI Application for Holberton School

require 'optparse'
require 'fileutils'

TASKS_FILE = 'tasks.txt'

# Parse command line options
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"

  opts.on("-a", "--add TASK", "Add a new task") do |task|
    options[:add] = task
  end

  opts.on("-l", "--list", "List all tasks") do
    options[:list] = true
  end

  opts.on("-r", "--remove INDEX", "Remove a task by index") do |index|
    options[:remove] = index.to_i
  end

  opts.on("-h", "--help", "Show help") do
    puts opts
    exit
  end
end.parse!

# Read existing tasks
def read_tasks
  File.exist?(TASKS_FILE) ? File.readlines(TASKS_FILE).map(&:chomp) : []
end

# Write tasks to file
def write_tasks(tasks)
  File.write(TASKS_FILE, tasks.join("\n") + "\n")
end

# Handle add operation
if options[:add]
  tasks = read_tasks
  tasks << options[:add]
  write_tasks(tasks)
  puts "Task '#{options[:add]}' added."
end

# Handle list operation
if options[:list]
  tasks = read_tasks
  if tasks.empty?
    puts "No tasks found."
  else
    puts "Tasks:"  # <-- LÍNEA AGREGADA
    tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
  end
end

# Handle remove operation
if options[:remove]
  tasks = read_tasks
  index = options[:remove] - 1
  
  if index >= 0 && index < tasks.size
    removed_task = tasks.delete_at(index)
    write_tasks(tasks)
    puts "Task '#{removed_task}' removed."
  else
    puts "Invalid task index."
  end
end

# Show help if no options provided
if options.empty?
  puts "Usage: cli.rb [options]"
  puts "    -a, --add TASK                   Add a new task"
  puts "    -l, --list                       List all tasks"
  puts "    -r, --remove INDEX               Remove a task by index"
  puts "    -h, --help                       Show help"
end
