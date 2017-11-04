#!../../bin/linux-x86/plc2epics
############################################################################
< envPaths
############################################################################
cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/plc2epics.dbd")
plc2epics_registerRecordDeviceDriver(pdbbase)

## Initialize EtherIP driver, define PLCs
## NOTE: if buffer limit is left at 500, read errors will occur.
EIP_buffer_limit(450)
drvEtherIP_init()
drvEtherIP_define_PLC("PLC_TORUS", "129.57.96.15", 0)

## Debugging [7-10]
#EIP_verbosity(7)

## Load record instances
dbLoadRecords("${DEVIOCSTATS}/db/iocAdminSoft.db","IOC=${IOC}")
dbLoadRecords("${AUTOSAVE}/asApp/Db/save_restoreStatus.db", "P=${IOC}:")
dbLoadTemplate("db/torus_force.substitutions")
dbLoadTemplate("db/torus_force_addons.substitutions")

dbLoadRecords("db/torus_fieldAverage.db")

cd ${TOP}/iocBoot/${IOC}

## autosave setup
< save_restore.cmd

iocInit

## autosave startup
## Handle autosave 'commands' contained in loaded databases.
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5, "P=xxx:")
create_monitor_set("info_settings.req", 30, "P=xxx:")
create_monitor_set("torus_force_settings.req", 30, "P=B_TORUS:,R=FOR:")

