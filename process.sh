# write a shell script to find top 5 process consuming highest memory.
#!/bin/bash
set -eo pipefail    
ps -eo pid,user,comm,%mem --sort=-%mem | head -n 6
# ps: process status command, -e: all processes, -o: output format, pid: process ID, comm: command name, %mem: memory usage percentage, --sort=-%mem: sort by memory usage in descending order, head -n 6: display top 5 processes (including header).
