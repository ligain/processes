#!/bin/bash


ITERATIONS=100000
H_PRIORITY='High priority process'
L_PRIORITY='Low priority process'

low_priority_proc(){
    (
        renice 20 $BASHPID
        time {

            for ((i=0; i<=$ITERATIONS; i++)); do
                echo "$1 $(($i * $i))" 
            done
        }
    )
} > low_priority_process.log


high_priority_proc(){
    (   
        renice -20 $BASHPID
        time {
            for ((i=0; i<=$ITERATIONS; i++)); do
                echo "$1 $(($i * $i))" 
            done
        }
    )
    
} > high_priority_process.log

echo "$L_PRIORITY time results:"
low_priority_proc $L_PRIORITY

printf "\n\n$H_PRIORITY time results:"
high_priority_proc $H_PRIORITY
