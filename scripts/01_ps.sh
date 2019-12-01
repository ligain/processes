#!/bin/bash


# Get all PIDs in /proc/
pids=$(ls /proc/ | egrep [0-9]+ | sort -g)
TICS_PER_SEC=$(getconf CLK_TCK)
DEFAULT_TTY='?'


printf "%-5s  %-5s  %-5s  %-5s  %s\n" 'PID' 'TTY' 'STAT' 'TIME' 'COMMAND'
for pid in $pids; 
do
    # Get process status
    status=$(cat /proc/$pid/stat 2>/dev/null | awk '{print $3}')

    # Get process TTY
    tty_proc=$(ls -l /proc/$pid/fd/ 2>/dev/null | egrep -o "tty[0-9]+" | uniq)
    tty=${tty_proc:=$DEFAULT_TTY}

    # Get process run command
    if [[ ! -s /proc/$pid/cmdline && -f /proc/$pid/stat ]] 
    then
        cmd=$(cat /proc/$pid/cmdline 2>/dev/null)
    else
        cmd=$(cat /proc/$pid/stat 2>/dev/null | awk '{print $2}')
    fi

    # Get process CPU time
    utime=$(cat /proc/$pid/stat 2>/dev/null | awk '{print $14}')  # in ticks
    stime=$(cat /proc/$pid/stat 2>/dev/null | awk '{print $15}')  # in ticks
    cutime=$(cat /proc/$pid/stat 2>/dev/null | awk '{print $16}') # in ticks
    cstime=$(cat /proc/$pid/stat 2>/dev/null | awk '{print $17}') # in ticks
    total_cpu_ticks=$((utime+stime+cutime+cstime))                # in ticks
    total_cpu_time=$((total_cpu_ticks/TICS_PER_SEC))              # in sec
    process_time=$(date -d"@$total_cpu_time" "+%M:%S")


    if [[ $cmd ]]; then
        printf "%-5s  %-5s  %-5s  %-5s  %s\n" $pid $tty $status $process_time $cmd
    fi


done