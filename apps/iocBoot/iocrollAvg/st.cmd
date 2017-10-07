#!../../bin/linux-x86_64/monitor
< envPaths
cd ${TOP}
dbLoadDatabase("dbd/monitor.dbd")
monitor_registerRecordDeviceDriver pdbbase

dbLoadRecords("db/cRIO_heartbeat_bi.db","P=rollAvg,R=:")

dbLoadTemplate("db/rollingAverages.substitutions")

dbLoadRecords("db/save_restoreStatus.db","P=${IOC}:")
dbLoadRecords("db/iocAdminSoft.db","IOC=${IOC}")

cd ${TOP}/iocBoot/${IOC}

< save_restore.cmd

iocInit

caPutLogInit("clonioc1:7011")

makeAutosaveFiles()
create_monitor_set("info_positions.req", 5, "P=${IOC}:")
create_monitor_set("info_settings.req", 30, "P=${IOC}:")

dbl > pv.list

