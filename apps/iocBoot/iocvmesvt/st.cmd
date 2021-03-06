cd "$IOC_root_vmesvt"

< cdCommands
< ../network-NAB
#< ../network-86
< ../nfsCommands

cd topbin
ld < svt.munch
cd top

putenv("EPICS_CA_AUTO_ADDR_LIST = NO")
putenv("EPICS_CA_ADDR_LIST = 129.57.163.255")

## Register all support components
dbLoadDatabase("dbd/svt.dbd")
svt_registerRecordDeviceDriver(pdbbase)

dbLoadTemplate("db/V450.substitutions")
dbLoadRecords("db/V450_1.db")
dbLoadRecords("db/V450_alarm.db")
dbLoadRecords("db/svtWatchdogVme.db")

dbLoadRecords("db/V450-alias.db")

# Why did we do this?
#dbLoadRecords("${DEVIOCSTATS}/db/iocAdminVxWorks-noReboot.db","IOC=iocvmesvt")
dbLoadRecords("${DEVIOCSTATS}/db/iocAdminVxWorks.db","IOC=iocvmesvt")

dbLoadRecords("db/save_restoreStatus.db", "P=iocvmesvt:")

cd startup

## autosave setup
< save_restore.cmd

asSetFilename("./svt.acf")
asSetSubstitutions("P=B_,R=SVT_")

#iocInit "../resource.def"
iocInit

## Handle autosave 'commands' contained in loaded databases.
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5, "P=iocvmesvt:")
create_monitor_set("info_settings.req", 30, "P=iocvmesvt:")

< tempToHumidity.cmd
< intlksOn.cmd

dbpf("${IOC}:SysReset.ASG","ALLWRITE")

#dbl > pv.list

