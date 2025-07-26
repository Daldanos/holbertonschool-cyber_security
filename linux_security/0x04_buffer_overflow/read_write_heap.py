#!/usr/bin/python3
"""Script to search and replace a string in the heap of a running process."""

import sys
import os
import re

def usage():
    print("Usage: read_write_heap.py pid search_string replace_string")
    sys.exit(1)

def main():
    if len(sys.argv) != 4:
        usage()

    pid = sys.argv[1]
    search_str = sys.argv[2]
    replace_str = sys.argv[3]

    if len(replace_str) > len(search_str):
        print("Error: replace_string must not be longer than search_string")
        sys.exit(1)

    try:
        with open(f"/proc/{pid}/maps", 'r') as maps_file:
            heap_line = None
            for line in maps_file:
                if '[heap]' in line:
                    heap_line = line
                    break

        if not heap_line:
            print("Heap segment not found.")
            sys.exit(1)

        # Obtener las direcciones de inicio y fin del heap
        match = re.match(r'^([0-9a-f]+)-([0-9a-f]+)', heap_line)
        if not match:
            print("Could not parse heap address.")
            sys.exit(1)

        heap_start = int(match.group(1), 16)
        heap_end = int(match.group(2), 16)

        # Abrir el archivo de memoria del proceso
        with open(f"/proc/{pid}/mem", 'rb+') as mem_file:
            mem_file.seek(heap_start)
            heap = mem_file.read(heap_end - heap_start)

            offset = heap.find(search_str.encode())
            if offset == -1:
                print("Search string not found in heap.")
                sys.exit(1)

            print(f"Found '{search_str}' at offset {hex(heap_start + offset)}")

            mem_file.seek(heap_start + offset)
            mem_file.write(replace_str.encode() + b'\x00' * (len(search_str) - len(replace_str)))
            print("Replacement done.")

    except PermissionError:
        print("Permission denied. Run the script as root.")
        sys.exit(1)
    except FileNotFoundError:
        print(f"Process {pid} not found.")
        sys.exit(1)

if __name__ == "__main__":
    main()

