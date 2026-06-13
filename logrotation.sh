#write a shell script to rotate log files.
#!/bin/bash
set -eo pipefail
log_dir="/var/log/myapp"
log_file="$log_dir/myapp.log"
threshold=85 
#get the current disk usage % of log directory
current_usage=$(df -h "$log_dir" | awk 'NR==2 {print $5}' | sed 's/%//')
#check if disk usage is greater than or equal to threshold
if [ "$current_usage" -ge "$threshold" ]; then
    # "disk usage is at $current_usage%, rotating log file..."
    # "create timestamped backup of log file and clear original log file"
    timestamp=$(date +"%Y%m%d%H%M%S")
    backup_file="$log_file.$timestamp"
    # "copy the log content and compress it on the fly to save space"
    tar -czf "$log_file" > "$backup_file"
    # using true > file ensures the original log file is cleared without deleting it, which is important for applications that keep the file handle open
    # It makes the file size zero,it is overwritten by nothing.
    true > "$log_file"
    echo "Log file rotated: $backup_file"
else
    echo "Disk usage is below threshold: $current_usage%"
fi  
