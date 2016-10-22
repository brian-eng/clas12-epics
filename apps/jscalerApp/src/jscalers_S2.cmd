#!../../bin/linux-x86_64/iocscalers
< envPaths
cd ${TOP}

Init_SCALERS()

Start_SCALERS_CRATE("0","ADCECAL2")
Start_SCALERS_CRATE("1","ADCPCAL2")
Start_SCALERS_CRATE("2","ADCFTOF2")
Start_SCALERS_CRATE("3","TDCECAL2")
Start_SCALERS_CRATE("4","TDCPCAL2")
Start_SCALERS_CRATE("5","TDCFTOF2")


## Register all support components
dbLoadDatabase("dbd/iocscalers.dbd")
iocscalers_registerRecordDeviceDriver(pdbbase)

## Load record instances
dbLoadRecords("db/iocAdminSoft.db", "IOC=${IOC}")

dbLoadTemplate("db/jscalers_S2_ECAL_FADC.sub")
dbLoadTemplate("db/jscalers_S2_LTCC_FADC.sub")
dbLoadTemplate("db/jscalers_S2_PCAL_FADC.sub")
dbLoadTemplate("db/jscalers_S2_FTOF_FADC.sub")
dbLoadTemplate("db/jscalers_S2_ECAL_DISC.sub")
dbLoadTemplate("db/jscalers_S2_LTCC_DISC.sub")
dbLoadTemplate("db/jscalers_S2_PCAL_DISC.sub")
dbLoadTemplate("db/jscalers_S2_FTOF_DISC.sub")


cd ${TOP}/iocBoot/${IOC}

iocInit

