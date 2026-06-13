# write shell script to find expiry date of SSL certificate and alert if it is less than 30 days.
#!/bin/bash
set -eo pipefail
domain="$1"
#fetch certificate expiry date
expiry_date=$(echo | openssl s_client -servername "$domain" -connect "$domain:443" 2>/dev/null | openssl x509 -noout -dates | grep 'notAfter' | cut -d= -f2)
#convert expiry date to seconds since epoch
expiry_seconds=$(date -d "$expiry_date" +%s)
#current date in seconds since epoch
current_seconds=$(date +%s)
#calculate days until expiry
days_until_expiry=$(( (expiry_seconds - current_seconds) / 86400 ))
#check if days until expiry is less than 30
if [ "$days_until_expiry" -lt 30 ]; then
    echo "SSL certificate for $domain is expiring in $days_until_expiry days, alerting..."
    # Here you can add code to send an email or trigger an alert
else
    echo "SSL certificate for $domain is valid for $days_until_expiry days." 
fi     