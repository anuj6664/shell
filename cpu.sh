# write shell script to monitor CPU usage and alert if it exceeds 80%.
#!/bin/bash
set -eo pipefail
threshold=80
# get the current CPU usage %
current_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | sed 's/%//')
# check if CPU usage is greater than or equal to threshold
if (( $(echo "$current_usage >= $threshold" | bc -l))); then
    echo "CPU usage is at $current_usage%, alerting..."
    # Here you can add code to send an email or trigger an alert
else
    echo "CPU usage is below threshold: $current_usage%"
fi  