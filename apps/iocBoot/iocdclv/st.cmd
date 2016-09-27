#!../../bin/linux-x86_64/A6551

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/A6551.dbd"
A6551_registerRecordDeviceDriver pdbbase

epicsEnvSet("STREAM_PROTOCOL_PATH","${TOP}/proto")

epicsEnvSet("scan","5 second")

## Configure devices

# FIRST TESTER:
#drvAsynIPPortConfigure("L0",129.57.160.95:1234,0,0,0)
#drvAsynIPPortConfigure("L0",129.57.160.108:1234,0,0,0)
#asynSetTraceMask("L0",-1,0x09)
#asynSetTraceIOMask("L0",-1,0x02)
#asynOctetSetOutputEos("L0",0,"\r\n")
#asynOctetSetInputEos("L0",0,"\n")
#dbLoadRecords("db/A6551.db","S=1,L=1,PORT=L0,ADDR=24,IMAX=2000,OMAX=2000")


# TEMPORARY in EEL125:
#drvAsynIPPortConfigure("L0",129.57.86.140:1234,0,0,0)
#dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC5_R1,PORT=L0,ADDR=24,IMAX=2000,OMAX=2000")
#asynOctetSetOutputEos("L0",0,"\r\n")
#asynOctetSetInputEos("L0",0,"\n")


# OLD TESTER:
#drvAsynIPPortConfigure("L0",hallb-gpib04.jlab.org:1234,0,0,0)
##dbLoadRecords("db/asynRecord.db","P=DCLV,R=:ASYN,PORT=L0,ADDR=1,IMAX=2000,OMAX=2000")
#dbLoadRecords("db/A6551.db","SCAN=${scan},P=DCLV,PORT=L0,ADDR=1,IMAX=2000,OMAX=2000")
##asynOctetSetOutputEos("L0",0,"\r\n")
#asynOctetSetOutputEos("L0",0,"\r")
#asynOctetSetInputEos("L0",0,"\n")
#asynSetTraceMask("L0",-1,0x09)
#asynSetTraceIOMask("L0",-1,0x02)


# NEW TESTER:
#drvAsynIPPortConfigure("S6R1",hallb-gpib01.jlab.org:1234,0,0,0)
#dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC6_R1,PORT=S6R1,ADDR=1,IMAX=2000,OMAX=2000")
#asynOctetSetOutputEos("S6R1",0,"\r")
#asynOctetSetInputEos("S6R1",0,"\n")
#asynSetTraceMask("S6R1",-1,0x09)
#asynSetTraceIOMask("S6R1",-1,0x02)




drvAsynIPPortConfigure("S1R1",hallb-gpib02.jlab.org:1234,0,0,0)
#drvAsynIPPortConfigure("S1R2",hallb-gpib05.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S1R3",hallb-gpib08.jlab.org:1234,0,0,0)
#drvAsynIPPortConfigure("S2R1",hallb-gpib03.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S2R2",hallb-gpib06.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S2R3",hallb-gpib09.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S3R1",hallb-gpib19.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S3R2",hallb-gpib15.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S3R3",hallb-gpib18.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S4R1",hallb-gpib11.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S4R2",hallb-gpib14.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S4R3",hallb-gpib20.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S5R1",hallb-gpib10.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S5R2",hallb-gpib13.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S5R3",hallb-gpib16.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S6R1",hallb-gpib01.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S6R2",hallb-gpib04.jlab.org:1234,0,0,0)
drvAsynIPPortConfigure("S6R3",hallb-gpib07.jlab.org:1234,0,0,0)

dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC1_R1,PORT=S1R1,ADDR=1,IMAX=2000,OMAX=2000")
#dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC1_R2,PORT=S1R2,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC1_R3,PORT=S1R3,ADDR=1,IMAX=2000,OMAX=2000")
#dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC2_R1,PORT=S2R1,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC2_R2,PORT=S2R2,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC2_R3,PORT=S2R3,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC3_R1,PORT=S3R1,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC3_R2,PORT=S3R2,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC3_R3,PORT=S3R3,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC4_R1,PORT=S4R1,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC4_R2,PORT=S4R2,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC4_R3,PORT=S4R3,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC5_R1,PORT=S5R1,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC5_R2,PORT=S5R2,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC5_R3,PORT=S5R3,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC6_R1,PORT=S6R1,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC6_R2,PORT=S6R2,ADDR=1,IMAX=2000,OMAX=2000")
dbLoadRecords("db/A6551.db","SCAN=${scan},P=B_DET_DC_LV_SEC6_R3,PORT=S6R3,ADDR=1,IMAX=2000,OMAX=2000")


# Non-DC hallb-gpibs:
##drvAsynIPPortConfigure("00",hallb-gpib00.jlab.org:1234,0,0,0)
##drvAsynIPPortConfigure("12",hallb-gpib12.jlab.org:1234,0,0,0)
##drvAsynIPPortConfigure("17",hallb-gpib17.jlab.org:1234,0,0,0)
##drvAsynIPPortConfigure("21",hallb-gpib21.jlab.org:1234,0,0,0)


#dbLoadTemplate("db/dclv.substitutions")

#dbLoadRecords("db/save_restoreStatus.db", "P=${IOC}:")
#dbLoadRecords("db/iocAdminSoft.db","IOC=${IOC}")

dbLoadRecords("db/iocAdminSoft.db","IOC=${IOC}")

cd ${TOP}/iocBoot/${IOC}

#< save_restore.cmd

dbl > pv.list

iocInit();

#caPutLogInit("clonioc1:7011")

#makeAutosaveFiles()
#create_monitor_set("info_positions.req", 5, "P=${IOC}:")
#create_monitor_set("info_settings.req", 30, "P=${IOC}:")
#create_monitor_set("dclv_settings.req",30,"P=HPSECALLV")

