#!/usr/bin/python3
"""
Heap String Finder and Replacer

This script finds a string in the heap of a running process and replaces it with another string.
"""

import sys
import os

def parse_maps(pid):
    """Parse the /proc/<pid>/maps file to find heap memory regions."""
    maps_file = f"/proc/{pid}/maps"
    heap_regions = []
    
    try:
        with open(maps_file, 'r') as f:
            for line in f:
                if '[heap]' in line:
                    parts = line.split()
                    addr_range = parts[0]
                    start, end = addr_range.split('-')
                    heap_regions.append((int(start, 16), int(end, 16)))
        return heap_regions
    except Exception as e:
        print(f"Error reading maps file: {e}")
        sys.exit(1)

def search_and_replace(pid, search_str, replace_str, heap_regions):
    """Search for the string in heap memory and replace it."""
    mem_file = f"/proc/{pid}/mem"
    search_bytes = search_str.encode('ASCII')
    replace_bytes = replace_str.encode('ASCII')
    
    if len(search_bytes) != len(replace_bytes):
        print("Error: Search and replace strings must be the same length")
        sys.exit(1)
    
    try:
        with open(mem_file, 'rb+') as f:
            for start, end in heap_regions:
                f.seek(start)
                chunk_size = 1024
                current_pos = start
                
                while current_pos < end:
                    try:
                        chunk = f.read(chunk_size)
                        if not chunk:
                            break
                        
                        # Search for the string in this chunk
                        offset = chunk.find(search_bytes)
                        if offset != -1:
                            replace_pos = current_pos + offset
                            f.seek(replace_pos)
                            f.write(replace_bytes)
                            print(f"Found and replaced at address: 0x{replace_pos:x}")
                            return True
                        
                        current_pos += chunk_size
                        # Back up a bit to catch strings that cross chunk boundaries
                        f.seek(current_pos - len(search_bytes) + 1)
                    except OSError:
                        # Skip inaccessible memory regions
                        break
        return False
    except Exception as e:
        print(f"Error accessing process memory: {e}")
        sys.exit(1)

def main():
    """Main function to handle command line arguments and execution."""
    if len(sys.argv) != 4:
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)
    
    try:
        pid = int(sys.argv[1])
        search_str = sys.argv[2]
        replace_str = sys.argv[3]
    except ValueError:
        print("Error: PID must be an integer")
        sys.exit(1)
    
    # Verify strings are ASCII
    try:
        search_str.encode('ASCII')
        replace_str.encode('ASCII')
    except UnicodeEncodeError:
        print("Error: Strings must be ASCII")
        sys.exit(1)
    
    # Check if process exists
    if not os.path.exists(f"/proc/{pid}"):
        print(f"Error: Process with PID {pid} does not exist")
        sys.exit(1)
    
    heap_regions = parse_maps(pid)
    if not heap_regions:
        print("Error: No heap memory region found")
        sys.exit(1)
    
    if not search_and_replace(pid, search_str, replace_str, heap_regions):
        print("Error: Could not find the search string in heap memory")

if __name__ == "__main__":
    main()
