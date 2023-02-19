#!/bin/bash

# Get a list of SSH sessions sorted by user and PID
ssh_sessions=$(ps aux | grep sshd | sort -k1,1)

# Loop through the SSH sessions
previous_user=""
concurrent_users_allowed=1
session_count=0
while read -r user pid rest; do
    if [[ "$user" == "$previous_user" ]] && [[ "$user" != "root" ]]; then
        ((session_count++))
        if (( session_count > concurrent_users_allowed )); then
            #echo "Killing user $user (pid $pid)"
            kill "$pid"
        fi
    else
        previous_user="$user"
        session_count=1
        # Set the number of concurrent sessions allowed for each user
        #if [[ "$user" == "alice" ]]; then
        #    concurrent_users_allowed=2
        #elif [[ "$user" == "bob" ]]; then
        #    concurrent_users_allowed=3
        #else
        #    concurrent_users_allowed=1
        fi
    fi
done <<< "$ssh_sessions"

# By M. Alipour - misteralipour.ir

# How to set run every 1 minute:
# $ crontab -e
# Add this line:
# * * * * * /path/to/script.sh
