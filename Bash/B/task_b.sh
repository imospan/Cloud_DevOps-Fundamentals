#!/bin/bash

logfile=$1

top_ip () {
    echo "1. From which ip were the most requests?"
    local result=$(cat $logfile | awk '{print $1}' | sort | uniq -c | sort -nr | awk '{print "From IP " $2 "\t were " $1 " requests" }' | head -n 1)
    echo -e "$result\n"
}

top_page () {
    echo "2. What is the most requested page?"
    result=$(cat $logfile | cut -d\" -f2 | awk '{print $2}' | egrep -iv "ico$|woff|ttf" | sort | uniq -c | sort -nr | head -n 1 | sed -e 's/^[ \t]*//')
    echo -e "$result\n"
}

ip_count () {
    echo "3. How many requests were there from each ip?"
    result=$(cat $logfile | awk '{print $1}' | sort | uniq -c | sort -nr | awk '{ip = $2; r = $1; printf "From IP %-15s - %d request%s\n", ip, r, r == 1 ? "" : "s"}')
    echo -e "$result\n"
}

absent () {
    echo "4. What non-existent pages were clients reffered to?"
    result=$(cat $logfile | grep " 404 " | cut -d\" -f2 | awk '{print $2}' | sort | uniq)
    echo -e "$result\n"
}

what_time () {
    echo "5. What time did site get the most requests?"
    result=$(cat $logfile | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":00"}' | sort -n | uniq -c | sort -rn)
    echo -e "$result\n"
}

search_bots () {
    echo "6. What search bots have accessed the site (UA + IP)?"
    result=$(cat $logfile | cut -d" " -f12 | grep -i bot | cut -d/ -f1 | sort | uniq | cut -c 2-)
    echo -e "$result\n"
}


if [[ $# -ne 1 ]]
then
    echo -e "Please, use log file name with a full path as an argument"
else
    top_ip
    top_page
    ip_count
    absent
    what_time
    search_bots
fi
