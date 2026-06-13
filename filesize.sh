# write shell script to find files larger than 500MB in a directory and its subdirectories and sort them by size in descending order.
#!/bin/bash
directory="$1"  
find "$directory" -type f -size +500M -exec ls -lh {} \; | awk '{ print $5, $9 }' | sort -hr
# find: search for files, -type f: regular files, -size +500M: files larger than 500MB, -exec ls -lh {} \;: list file details, awk '{ print $5, $9 }': print file size and name, sort -hr
