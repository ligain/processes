# Linux processes  practice
1) `scripts/01_ps.sh`  script is a clone of command `ps ax` and produce similar output:
```bash
$ ./01_ps.sh 
PID    TTY    STAT   TIME   COMMAND
1      ?      S      00:23  /sbin/initsplash
406    ?      S      00:02  /lib/systemd/systemd-journald
429    ?      S      00:00  /sbin/lvmetad-f
437    ?      S      00:02  /lib/systemd/systemd-udevd
...
```
5) `scripts/05_nice.sh`  script show the difference between processes  run with `nice -20` and `nice +20` priority. **This script must be run with root permissions**
Sample output:
```
$ sudo ./scripts/05_nice.sh 
Low priority process time results:

real    0m1.912s
user    0m1.592s
sys 0m0.316s


High priority process time results:
real    0m1.508s
user    0m1.176s
sys 0m0.332s
```
Output logs for low and high priority processes run-time saves at `~/low_priority_process.log` and `~/high_priority_process.log` files respectively.
# Project Goals 
The code is written for educational purposes.