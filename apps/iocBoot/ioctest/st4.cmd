#!../../bin/linux-x86_64/testApp
< envPaths
cd ${TOP}
dbLoadDatabase("dbd/testApp.dbd")
testApp_registerRecordDeviceDriver pdbbase

#epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES","1000000")

dbLoadRecords("db/wf_test.db")

cd "${TOP}/iocBoot/${IOC}"

iocInit


dbl > pv.list

