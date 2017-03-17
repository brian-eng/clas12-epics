#!/bin/sh

ioc=iocsoftsvtR1
port=20002
logdir=/usr/clas12/DATA/logs
epics=/home/baltzell/clas12-epics-svtiocs

procServ -n $ioc -i^D^C --logfile $logdir/$ioc.log --logstamp -c $epics/apps/iocBoot/$ioc $port ./st.cmd
