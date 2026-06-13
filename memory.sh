# write shell script to monitor memory usage and alert if it exceeds 80.
#!/bin/bash
set -eo pipefail
threshold=80
# get the current memory usage %
current_usage=$(free | awk '/Mem/{printf("%.2f"), $3/$2 * 100}')
# check if memory usage is greater than or equal to threshold
if (( $(echo "$current_usage >= $threshold" | bc -l))); then
    echo "Memory usage is at $current_usage%, alerting..."  
    # Here you can add code to send an email or trigger an alert
else
    echo "Memory usage is below threshold: $current_usage%"
fi  