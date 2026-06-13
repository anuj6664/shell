# write a shell script to find the disk utilization and alert if it reaches 80%.
#!/bin/bash
set -eo pipefail
threshold=80
# get the current disk usage % of root directory
current_usage=$(df -h /mnt/c | awk 'NR==2 {print $5}' | sed 's/%//')
# check if disk usage is greater than or equal to threshold
if [ "$current_usage" -ge "$threshold" ]; then
    echo "Disk usage is at $current_usage%, alerting..."
    # Here you can add code to send an email or trigger an alert
else
    echo "Disk usage is below threshold: $current_usage%"
fi  