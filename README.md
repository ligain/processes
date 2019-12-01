
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

# Run  

0) `vagrant`  should be installed on your system
```
$ vagrant -v
Vagrant 2.2.5
```
1) Clone this repository
```bash  
$ git clone https://github.com/ligain/lvm.git  
``` 
2) Go to project folder
```bash  
$ cd lvm/
```  
3) Run `Vagrantfile`
```bash  
$ vagrant up
```  

# Project Goals 
The code is written for educational purposes.