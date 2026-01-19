#!/bin/bash

# $0 = script name
# $1 = first argument
# $2 = second argument
# $3 = third argument
# $[1-9] = argument number

if [ -z "$1" ]; then
    echo "Usage: log-archive <log-directory>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: Directory '$1' does not exist"
    exit 1
fi

log_dir=$1
timestamp=$(date +%Y%m%d_%H%M%S)
tar -czf "logs_archive_${timestamp}.tar.gz" "$log_dir"
echo "$(date '+%Y-%m-%d %H:%M:%S') - Archived $log_dir to logs_archive_${timestamp}.tar.gz" >> archive.log