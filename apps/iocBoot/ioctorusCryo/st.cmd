#!../../bin/linux-x86/plc2epics
############################################################################
< envPaths
############################################################################
cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/plc2epics.dbd")
plc2epics_registerRecordDeviceDriver(pdbbase)

# Initialize EtherIP driver, define PLCs
drvEtherIP_init()
drvEtherIP_define_PLC("PLC_CRYO",  "129.57.96.17", 0)
drvEtherIP_define_PLC("PLC_TORUS", "129.57.96.15", 0)

## Load record instances
dbLoadRecords("${DEVIOCSTATS}/db/iocAdminSoft.db","IOC=${IOC}")
dbLoadRecords("${AUTOSAVE}/asApp/Db/save_restoreStatus.db", "P=${IOC}:")
# PLC_CRYO
dbLoadTemplate("db/cryodbox_torus_LHe.substitutions")
dbLoadTemplate("db/cryodbox_torus_LN2.substitutions")
# PLC_TORUS
dbLoadTemplate("db/torus_LHe.substitutions")
dbLoadTemplate("db/torus_LN2.substitutions")

cd ${TOP}/iocBoot/${IOC}

## autosave setup
< save_restore.cmd

iocInit

## autosave startup
## Handle autosave 'commands' contained in loaded databases.
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5, "P=xxx:")
create_monitor_set("info_settings.req", 30, "P=xxx:")

