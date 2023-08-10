#!/bin/bash

# Check if the user has root privileges
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run with root privileges. Exiting."
  exit 1
fi

# Print current memory usage
echo "Current memory usage:"
free -h

# Clear page cache, dentries, and inodes
echo "Clearing page cache, dentries, and inodes..."
sync
echo 1 > /proc/sys/vm/drop_caches
echo 2 > /proc/sys/vm/drop_caches
echo 3 > /proc/sys/vm/drop_caches

# Print memory usage after clearing cache
echo "Memory usage after clearing cache:"
free -h
