#!/bin/bash

timer_start=$(date +%s)

echo "Total number of folders (including all nested ones) =$(find $1 -type d | wc -l)"
echo "TOP 5 folders of maximum size arranged in descending order (path and size): $(du -h --max-depth=1 $1 2>/dev/null | sort -rh | head -n 6)"
echo "Total number of files = $(find $1 -type f | wc -l)"
echo "Number of:"
echo "Configuration files (with the .conf extension) =$(find $1 -type f -name "*.conf" | wc -l)"
echo "Text files =$(find $1 -type f -exec file {} \; | grep -c "text")"
echo "Executable files =$(find $1 -type f -executable | wc -l)"
echo "Log files (with the extension .log) =$(find $1 -type f -name "*.log" | wc -l)"
echo "Archive files =$(find $1 -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" -o -name "*.bz2" -o -name "*.xz" \) | wc -l)"
echo "Symbolic links =$(find $1 -type l | wc -l)"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$(find $1 -type f -exec du -h {} + | sort -rh | head -n 10)"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"

file=$(find $1* 2>/dev/null -type f -executable -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d")
if ! [[ -z $file ]]; then
    echo -n "$i - "
    echo -n "$(echo $file | awk '{print $2",", $1}'), "
    path=$(echo $file | awk '{print $2}')
    hash=$(md5sum $path | awk '{print $1}')
    echo "$hash"
fi

timer_end=$(date +%s)
echo "Script execution time (in seconds) = $(($timer_end-$timer_start))"