# shellscripts
Some usefull shellscripts...

1. Title: Limit Concurrent SSH Sessions

Description: This Bash script limits the number of concurrent SSH sessions allowed for each user on a Linux system. By default, it allows only one session per user (except for the root user). However, you can customize the limit for specific users by modifying the script. 

The script works by parsing the output of the "ps aux" command to get a list of all SSH sessions sorted by user and PID. It then loops through the sessions and keeps track of the number of sessions for each user. If the number of sessions exceeds the limit, the script terminates the oldest session for that user.

Usage: To use the script, simply copy the code into a file on your Linux system (e.g., /usr/local/bin/ssh-limit.sh) and make it executable (chmod +x /usr/local/bin/ssh-limit.sh). Then, add the following line to your crontab to run the script every minute:

\* * * * * /usr/local/bin/ssh-limit.sh >/dev/null 2>&1

Note: The script requires root privileges to execute, as it needs to kill other users' SSH sessions. Use it with caution and at your own risk.

Author: <a href="https://github.com/misteralipour/">@misteralipour</a>

